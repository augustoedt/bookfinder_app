import 'package:book_finder/models/book.dart';
import 'package:book_finder/service/book_finder_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookFinder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: BookFinderService.browseBook(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            List<Book> _books = snapshot.data;
            return ListView(
              children: _books.map((e) => ListTile(title: Text(e.volumeInfo.title),)).toList(),
            );
          }
          if(snapshot.hasError){
            print(snapshot.error);
            return Center(child: Icon(Icons.warning, color: Colors.red,),);
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}
