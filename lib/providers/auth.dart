import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/http_exception.dart';

class Auth with ChangeNotifier{
  String _token;
  DateTime _expiredToken;
  String _userId;
  Timer _timer;
  
  bool get isAuth{
    return token != null;
  }

  String get token{
    if(_token != null && _userId != null && _expiredToken != null){
      return _token;
    }
    return null;
  }


  Future<void> _authentication(String email, String password, String queryParams) async {
    final url = 'https://identitytoolkit.googleapis.com/v1/$queryParams?key=AIzaSyAY2S1abLCKxE55Rka0x6IwGeuBg-XoTwM';

    try{
      final response = await http.post(url, body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true
      }));

      final responseData  = json.decode(response.body);
      if(responseData['error'] != null){
        throw HttpException(responseData['error']['message']);
      } 

      _token            = responseData['idToken'];
      _expiredToken     = DateTime.now().add(Duration(seconds: int.parse(responseData['expiresIn'])));
      _userId           = responseData['localId'];

      notifyListeners();

      //set session
      final prefs     = await SharedPreferences.getInstance();
      final userData  = json.encode({
        'token' : _token,
        'userId': _userId,
        'expiredDate': _expiredToken.toIso8601String()
      }); 

      prefs.setString('userData', userData);

    } catch (err){
      throw err;
    }

  }

  Future<void> login(String email, String password) async {
    return _authentication(email, password, 'accounts:signInWithPassword');
  }

  Future<void> signUp(String email, String password) async {
    return _authentication(email, password, 'accounts:signUp');
  }

  Future<void> tryToAutoLogin() async {
    final prefs         = await SharedPreferences.getInstance();
    final extractData   = json.decode(prefs.getString('userData')) as Map<String, Object>;
    final expiredDate   = DateTime.parse(extractData['expiredDate']);

    if(expiredDate.isBefore(DateTime.now())){
      return false;
    }

    _token        = extractData['token'];
    _userId       = extractData['userId'];
    _expiredToken = expiredDate;

    notifyListeners(); 
    return true;
  }

 
}