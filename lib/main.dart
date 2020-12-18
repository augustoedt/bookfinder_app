import 'package:book_finder/locator.dart';
import 'package:book_finder/manager/book_finder_manager.dart';
import 'package:book_finder/manager/global_manager.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'screens/book_finder/book_finder.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final getIt = GetIt.instance;
  getIt.registerSingletonAsync<GlobalManager>(() async{
    // final themeManager = ThemeManager();
    // await themeManager.init();
    // return themeManager;
    final globalManager = GlobalManager();
    await globalManager.init();
    return globalManager;
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
        final globalManager = GetIt.I.get<GlobalManager>();
        return StreamBuilder<GlobalState>(
            stream: globalManager.globalStream$,
            builder: (_, AsyncSnapshot<GlobalState> snapshot){
              if(snapshot.hasData){
                final globalState = snapshot.data;
                return MaterialApp(
                  title: 'Flutter Demo',
                  theme: globalState.themeData,
                  home: BookFinder(),
                  debugShowCheckedModeBanner: false,
                );
              }
              return const Center(child: CircularProgressIndicator());
            }
            );
      }
      return const MaterialApp(home: Scaffold(body: Center(child: CircularProgressIndicator())),);
    });
  }
}
