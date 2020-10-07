import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppTheme{
  LightTheme,
  DarkTheme
}

MaterialColor materialColor = MaterialColor(
    0xFF292D36,
    <int, Color>{
      50: Color(0xFFE8E9ED),
      100: Color(0xFFC5C9D3),
      400: Color(0xFF353A46),
      500: Color(0xFF292D36),
      900: Color(0xFF121317)
});

final Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.LightTheme: ThemeData(
    brightness: Brightness.light,
    accentColor: Color(0xFFFA784A),
    primaryColor: materialColor.shade50,
    primaryTextTheme: TextTheme(
        headline1: GoogleFonts.josefinSans(color:  Colors.black87, fontSize: 26, fontWeight: FontWeight.bold),
        headline2: GoogleFonts.josefinSans(color:  Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
        headline4: GoogleFonts.lora(color: Colors.black87, fontSize: 14),
        //title
        headline6: GoogleFonts.josefinSans(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w900),
        //subtitle
        subtitle2: GoogleFonts.josefinSans(color: Colors.black87, fontSize: 12, fontWeight: FontWeight.w600),
        bodyText2: GoogleFonts.lato(color: Colors.black54, fontSize: 14),
      )


  ),
  AppTheme.DarkTheme: ThemeData(
    brightness: Brightness.dark,
    accentColor: Color(0xFFFA784A),
    primaryColor: materialColor.shade400,
    scaffoldBackgroundColor: Color(0xFF1D212B),
    primaryTextTheme: TextTheme(
      headline1: GoogleFonts.josefinSans(color:  Colors.white70, fontSize: 26, fontWeight: FontWeight.bold),
      headline2: GoogleFonts.josefinSans(color: Colors.white70, fontSize: 20, fontWeight: FontWeight.bold),
      headline4: GoogleFonts.lora(color: Colors.white70, fontSize: 14),
      //title
      headline6: GoogleFonts.josefinSans(color: Colors.white70, fontSize: 14, ),
      //subtitle
      subtitle2: GoogleFonts.josefinSans(color: Colors.white60, fontSize: 12),
      bodyText2: GoogleFonts.lato(color: Colors.white, fontSize: 14),
    )
  )
};

class ThemeService{

  static Future<ThemeData> getLastTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String theme = (prefs.getString("theme")?? "light");
    print("getlastTheme: $theme");
    if(theme=="light") return appThemeData[AppTheme.LightTheme];
    return appThemeData[AppTheme.DarkTheme];
  }

  static saveTheme(String theme) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("theme",theme);
    print("saving: $theme");
  }
}