import 'package:book_finder/manager/book_finder_manager.dart';
import 'package:book_finder/manager/theme_manager.dart';
import 'package:book_finder/models/book.dart';
import 'package:book_finder/models/book_search.dart';
import 'package:book_finder/widgets/book_list_item.dart';
import 'package:book_finder/widgets/search_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';


class BookFinder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BookFinderManager manager  = GetIt.I.get<BookFinderManager>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Book Finder", style: Theme.of(context).primaryTextTheme.headline1),
        actions: [
          IconButton(icon: Icon(Icons.palette), onPressed: (){
            GetIt.I.get<ThemeManager>().switchTheme();
          })
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<BFState>(
            stream: manager.finder$,
            builder: (context, snapshot) {
              BFState data = snapshot.data;
              if (data is LoadingBFState) {
                return _loading();
              }
              if (data is LoadedBFState) {
                print("snapshot");
                BookSearch bookSearch = (snapshot.data as LoadedBFState).search;
                List<Book> list = bookSearch.books;
                return Column(
                  children: [
                    SizedBox(height: 18,),
                    SearchTextField(),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(icon: Icon(Icons.chevron_left), onPressed: (){
                            manager.searchLeftNavigate(bookSearch);
                          }),
                          Text("${bookSearch.startIndex+bookSearch.maxResults}/${bookSearch.totalItems}"),
                          IconButton(icon: Icon(Icons.chevron_right), onPressed: (){
                            manager.searchRightNavigate(bookSearch);
                          })
                        ],
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                          padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                              maxCrossAxisExtent: 140,
                              childAspectRatio: 128/240
                          ),
                          itemCount: list.length,
                          itemBuilder: (context, index){
                            return BookListItem(book: list[index]);
                          }
                      ),
                    )
                  ],
                );
              }
              if(data is ErrorFBState){
                return _initial();
              }
              return SearchTextField();
            },
          )),
    );
  }

  Widget _initial() {
    return SearchTextField();
  }

  Widget _loading() {
    return Center(child: CircularProgressIndicator());
  }
}
