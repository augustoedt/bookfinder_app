import 'package:book_finder/models/book_search.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            SizedBox(height: 18,),
            Container(
                width: 350,
                child: TextField(
                  onSubmitted: (value) {
                    MyApp.manager.search(BookSearch(term: value));
                  },
                  decoration:
                  InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: (){
                          // MyApp.manager.search(BookSearch(term: value));
                        },
                        icon: Icon(Icons.search),
                      )
                  ),
                )),
          ],
        ));
  }
}
