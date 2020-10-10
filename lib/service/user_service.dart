import 'dart:convert';
import 'package:book_finder/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService{
  static Future<User> loadLocalUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String content = prefs.getString('localUser') ?? "no-user";
    if(content=="no-user"){
      print("load no-user");
      User _user = User(userPicUrl: "", name: "DefaultUser", favorites: []);
      String userContent = json.encode(_user.toJson());
      await prefs.setString('localUser', userContent);
      return _user;
    }
    else{
      print("load user");
      User _user= User.fromJson(json.decode(content));
      return _user;
    }
  }
}