
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserModel{
  final String login;
  final String password;
  final String userId;
  final String userToken;

   UserModel({
    required this.login,
     required this.password,
     required this.userId,
     required this.userToken
});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      login: json['login'],
      password: json['password'],
      userToken: json['token'],
      userId: json['id'],
    );
  }

  Map<String, dynamic> toJson() => {
    'login': login,
    'password': password,
    'userId': userId,
    'userToken': userToken,
  };
}

Future<void> saveUser(UserModel user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userJson = jsonEncode(user.toJson());
  await prefs.setString('user', userJson);
}

  Future<UserModel?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');
    if (userJson != null) {
      return UserModel.fromJson(jsonDecode(userJson));
    }
    return null;
}
