import 'package:book_finder/service/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';


class ThemeManager{
  BehaviorSubject _controller;


  ThemeManager();

  Future init() async{
    ThemeData theme = await  ThemeService.getLastTheme();
    _controller = BehaviorSubject<ThemeState>.seeded(InitialThemeState(theme));
  }


  Stream get themeStream$ => _controller.stream;


  void switchTheme(){
      ThemeData theme = _controller.stream.value.theme;
      if(theme == appThemeData[AppTheme.LightTheme]){
        _controller.add(DarkThemeState());
      }else{
        _controller.add(LightThemeState());
      }
  }



  void dispatch(){
    _controller.close();
  }
}

abstract class ThemeState{
  ThemeData theme = appThemeData[AppTheme.LightTheme];
  ThemeState();
}

class DarkThemeState extends ThemeState{
  final ThemeData theme = appThemeData[AppTheme.DarkTheme];
  DarkThemeState(){
    ThemeService.saveTheme("dark");
  }
}

class LightThemeState extends ThemeState{
  final ThemeData theme = appThemeData[AppTheme.LightTheme];
  LightThemeState(){
    ThemeService.saveTheme("light");
  }
}

class InitialThemeState extends ThemeState{
  final ThemeData theme;
  InitialThemeState(this.theme);
  InitialThemeState.light() : theme = appThemeData[AppTheme.LightTheme];
  InitialThemeState.dark() : theme = appThemeData[AppTheme.DarkTheme];
}
