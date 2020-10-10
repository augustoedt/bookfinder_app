import 'package:book_finder/locator.dart';
import 'package:book_finder/manager/book_finder_manager.dart';
import 'package:book_finder/manager/theme_manager.dart';
import 'package:book_finder/screens/bookfinder.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt  getIt = GetIt.instance;
  getIt.registerSingletonAsync<ThemeManager>(() async{
    final themeManager = ThemeManager();
    await themeManager.init();
    return themeManager;
  });
  // getIt.registerSingletonAsync((User) => )
  getIt.registerSingleton<BookFinderManager>(BookFinderManager());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getIt.allReady(),
        builder: (_, futureSnapshot){
      if(futureSnapshot.hasData){
        final themeManager = GetIt.I.get<ThemeManager>();
        return StreamBuilder<ThemeState>(
            stream: themeManager.themeStream$,
            builder: (_, snapshot){
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
      return MaterialApp(home: Scaffold(body: Center(child: CircularProgressIndicator())),);
    });
  }
}
