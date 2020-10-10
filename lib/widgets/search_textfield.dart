import 'package:book_finder/manager/book_finder_manager.dart';
import 'package:book_finder/models/book_search.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../main.dart';

class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BookFinderManager manager  = GetIt.I.get<BookFinderManager>();
    return Center(
        child: Column(
          children: [
            SizedBox(height: 18,),
            Container(
                width: 350,
                child: TextField(
                  onSubmitted: (value) {
                    manager.search(BookSearch(term: value, startIndex: 0));
                  },
                  decoration:
                  InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: (){
                          // manager.search(BookSearch(term: value));
                        },
                        icon: Icon(Icons.search),
                      )
                  ),
                )),
          ],
        ));
  }
}
