
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class User with ChangeNotifier {
  final String id;
  final String userId;
  final String userName;
  final String fullName;
  final String email;
  final String password;
  final String gender;
  final DateTime dateOfBird;
  final int phone;
  final String address;
  final String imageUrl;

  User({
    this.id,
    this.userId,
    this.userName,
    this.fullName,
    this.email,
    this.password,
    this.gender,
    this.dateOfBird,
    this.phone,
    this.address,
    this.imageUrl
  });
  
}

class UserData with ChangeNotifier {
  final String _userId;
  final String _authToken;
  List<User> _userData = [];

  UserData(this._userId, this._authToken, this._userData);  


  List<User> get user {
    return [..._userData];
  }

  /**
   * after signin 
   * Fetch user from API
   * and add to variable for saving temporary data
   */

  Future<void> fetchUserProfile() async {
    var url = 'https://swatch-shop.firebaseio.com/users.json?orderBy="userId"&equalTo="$_userId"&auth=$_authToken';
    try{
      final response      = await http.get(url);
      final responseUser  = json.decode(response.body) as Map<String, dynamic>;
      final List<User>loadedUser    = [];

      responseUser.forEach( (index, user){
        loadedUser.add(User(
          id: index,
          userId: user['userId'],
          userName: user['userName'],
          fullName: user['fullName'],
          email: user['email'],
          password: user['password'],
          gender: user['gender'],
          dateOfBird: DateTime.parse(user['dateOfBird']),
          phone: user['phone'],
          imageUrl: user['imageUrl'],
          address: user['address']
        ));
        _userData = loadedUser;
        notifyListeners();
        
      });
    
    } catch (err){
      throw err;
    }
  }

  User getUserProfile(){
    return _userData.firstWhere( (user) => user.userId == _userId );
  }

  void updateUser(String id, User userData) async {
    final userIndex = _userData.indexWhere( (user) => user.id == id ); 
    var url         = 'https://swatch-shop.firebaseio.com/users/$id.json?auth=$_authToken';
    
    try{
      final response = await http.patch(url, body: json.encode({
        'id': id,
        'userId': userData.userId,
        'password': userData.password, 
        'userName': userData.userName,
        'fullName': userData.fullName,
        'email': userData.email,
        'gender': userData.gender,
        'dateOfBird': userData.dateOfBird.toString(),
        'phone': userData.phone,
        'address': userData.address,
        'imageUrl': userData.imageUrl,
      }));
      _userData[userIndex] = userData;
      notifyListeners();
    } catch (err){
      throw err;
    }

  }

  
}