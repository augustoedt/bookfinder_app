import 'package:book_finder/manager/login_manager.dart';
import 'package:book_finder/manager/theme_manager.dart';
import 'package:book_finder/models/user.dart';
import 'package:book_finder/service/login_service.dart';
import 'package:book_finder/service/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class GlobalManager implements ThemeManager, LoginManager {
  //Implements managers that affects global app state, like Theme and Login
  User _user =  User.empty();
  ThemeData _theme = ThemeService.appThemeData[AppThemeType.lightTheme];

  User get user => _user;

  ThemeData get theme => _theme;

  final _controller = BehaviorSubject<GlobalState>();

  Stream<GlobalState> get globalStream$ => _controller.stream;

  GlobalManager();

  Future<void> init() async {
    await lastTheme();
    await login();
    _controller.sink.add(GlobalState(user, theme));
  }

  @override
  Future<void> switchTheme() async {
    if (theme == ThemeService.appThemeData[AppThemeType.lightTheme]) {
      _theme = ThemeService.appThemeData[AppThemeType.darkTheme];
      await ThemeService.saveTheme("dark");
    } else {
      _theme = ThemeService.appThemeData[AppThemeType.lightTheme];
      await ThemeService.saveTheme("light");
    }
    _controller.sink.add(GlobalState(user, theme));
  }

  @override
  Future<void> lastTheme() async {
    _theme = await ThemeService.getLastTheme();
  }

  @override
  Future<void> disconnect() async{
    _user = User.empty();
  }

  @override
  Future<void> login() async{
    _user = await LoginService.mockLoginUser();
    if(_user == null){
      //ask for create login
      //login with user
    }
  }

  @override
  bool isLogged(){
    return _user.isLogged;
  }

}

class GlobalState{
  final User user;
  final ThemeData themeData;
  const GlobalState(this.user, this.themeData);
}