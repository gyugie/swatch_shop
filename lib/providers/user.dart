import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class User with ChangeNotifier {
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
    @required this.userId,
    this.userName,
    this.fullName,
    @required this.email,
    @required this.password,
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
          userId: user['userId'],
          userName: user['userName'],
          fullName: user['fullName'],
          email: user['email'],
          password: user['password'],
          gender: user['gender'],
          dateOfBird: user['dateOfBird'],
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

}