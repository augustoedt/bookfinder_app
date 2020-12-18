import 'package:book_finder/manager/global_manager.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final manager = GetIt.I.get<GlobalManager>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Settings", style: Theme.of(context).primaryTextTheme.headline1,),
        ),
        body: ListView(
          children: [
            ListTile(
              title: RaisedButton(
                    color: Theme.of(context).accentColor,
                    onPressed: (){manager.switchTheme();},
                    child: const Text("Change Theme")
              ),
            )
          ],
        ),
      ),
    );
  }
}
