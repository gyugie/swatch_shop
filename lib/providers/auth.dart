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

  Future<void> _authentication(String email, String password, String queryParams) async {
    final url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAY2S1abLCKxE55Rka0x6IwGeuBg-XoTwM';

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
}