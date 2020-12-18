import 'dart:convert';

import 'package:book_finder/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService{
  static const String localGuess = 'localSessionGuess';
  static const String localUser = 'localSessionUser';

  static Future<User> mockLoginUser() async {
     // verify if has local data user
    String userKey;
    if(await hasCookieLogin(localUser)){
      userKey = localGuess;
    }else if(await hasCookieLogin(localGuess)){
      userKey = localGuess;
    }else{
      return User.empty();
    }
    final prefs = await SharedPreferences.getInstance();
    final userContent = prefs.getString(userKey);
    return User.fromJson(json.decode(userContent) as Map<String, dynamic>);
  }
  static Future<bool> hasCookieLogin(String type) async {
    final prefs = await SharedPreferences.getInstance();
    if(prefs.getString(type)!= null){
      return true;
    }
    return false;
  }

  static Future<void> saveUserData(User user, String type) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(type, json.encode(user.toJson()));
  }
}