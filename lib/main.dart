import 'package:book_finder/manager/book_finder_manager.dart';
import 'package:book_finder/manager/theme_manager.dart';
import 'package:book_finder/screens/bookfinder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static BookFinderManager manager = new BookFinderManager();
  static ThemeManager themeManager = new ThemeManager();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeState>(
        initialData: InitialThemeState(),
        stream: themeManager.themeStream$,
        builder: (context, snapshot){
          if(snapshot.data is ThemeState){
            ThemeData themeData = snapshot.data.theme;
            return MaterialApp(
              title: 'Flutter Demo',
              theme: themeData,
              home: BookFinder(),
              debugShowCheckedModeBanner: false,
            );
          }
          return Center(child: CircularProgressIndicator());

        });
  }
}
