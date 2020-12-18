import 'dart:convert';
import 'package:book_finder/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService{
  static Future<User> loadLocalUser() async {

    final prefs = await SharedPreferences.getInstance();
    final content = prefs.getString('localUser');
    prefs.clear();
    if(content!=null){
      final User _user= User.fromJson(json.decode(content) as Map<String, dynamic>);
      return _user;
    }else{
      prefs.setString("localUser", json.encode(User.empty()));
      return User.empty();
    }
  }
}