import 'package:book_finder/main.dart';
import 'package:book_finder/models/book.dart';
import 'package:book_finder/models/book_search.dart';
import 'package:book_finder/widgets/book_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookFinder extends StatefulWidget {
  @override
  _BookFinderState createState() => _BookFinderState();
}

class _BookFinderState extends State<BookFinder> {

  BookSearch search = BookSearch(term:"", startIndex: 0, maxResults: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: TextField(
            onSubmitted: (value) {
              search.term = value;
              MyApp.manager.finder(search);
            },
          ),
          subtitle:  StreamBuilder(
            stream: MyApp.manager.finder$,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Book> _books = snapshot.data;
                return GridView(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      childAspectRatio: 124 / 220,
                      maxCrossAxisExtent: 155,
                      mainAxisSpacing: 10),
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  children: _books
                      .map((e) => BookListItem(
                    book: e,
                  ))
                      .toList(),
                );
              }
              if (snapshot.hasError) {
                print(snapshot.error);
                return Center(
                  child: Icon(
                    Icons.warning,
                    color: Colors.red,
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          // trailing: CircleAvatar(
          //   child: IconButton(
          //     onPressed: (){
          //       MyApp.manager.nextPage(search);
          //     },
          //     icon: Icon(Icons.send),
          //   ),
          // ),
        ),
      ),
    );
  }
}
