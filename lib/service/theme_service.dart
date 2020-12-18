import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppThemeType{
  lightTheme,
  darkTheme
}

class ThemeService{

  ThemeService();

  static const  _materialColor = MaterialColor(
      0xFF292D36,
      <int, Color>{
        50: Color(0xFFE8E9ED),
        100: Color(0xFFC5C9D3),
        400: Color(0xFF353A46),
        500: Color(0xFF292D36),
        900: Color(0xFF121317)
      });

  static Map<AppThemeType, ThemeData> appThemeData = {
    AppThemeType.lightTheme: ThemeData(
        brightness: Brightness.light,
        accentColor: const Color(0xFFFA784A),
        primaryColor: _materialColor.shade50,
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
    AppThemeType.darkTheme: ThemeData(
        brightness: Brightness.dark,
        accentColor: const Color(0xFFFA784A),
        primaryColor: _materialColor.shade400,
        scaffoldBackgroundColor: const Color(0xFF1D212B),
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

  static Future<ThemeData> getLastTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme') ?? 'light';
    print(theme);
    if(theme=="light") return appThemeData[AppThemeType.lightTheme];
    return appThemeData[AppThemeType.darkTheme];
  }

  static Future<void> saveTheme(String theme) async{
    final prefs = await SharedPreferences.getInstance();
    print(theme);
    await prefs.setString("theme",theme);
  }
}