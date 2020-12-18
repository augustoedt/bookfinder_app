import 'package:book_finder/manager/book_finder_manager.dart';
import 'package:book_finder/models/book.dart';
import 'package:book_finder/models/book_search.dart';
import 'package:book_finder/screens/book_finder/custom_drawer.dart';
import 'package:book_finder/screens/settings_screen.dart';
import 'package:book_finder/screens/widgets/search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';

import 'book_list_item.dart';

class BookFinder extends StatelessWidget {
  Widget _initial() {
    return SearchTextField(BookSearch.empty());
  }

  Widget _loading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildContent(BuildContext context, BookFinderManager manager){
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<BFState>(
          stream: manager.finder$,
          builder: (_, snapshot) {
            final data = snapshot.data;
            if (data is LoadingBFState) {
              return _loading();
            }
            if (data is LoadedBFState) {
              final bookSearch = (snapshot.data as LoadedBFState).search;
              final bookList = bookSearch.books;
              return Column(
                children: [
                  SearchTextField(bookSearch),
                  _buildGrid(context, bookList)
                ],
              );
            }
            if (data is ErrorFBState) {
              return _initial();
            }
            return SearchTextField(BookSearch.empty());
          },
        ));
  }

  Widget _buildGrid(BuildContext context, List<Book> booklist){
    return Expanded(
      child: GridView.builder(
          padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
          gridDelegate:
          const SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              maxCrossAxisExtent: 140,
              childAspectRatio: 120 / 240),
          itemCount: booklist.length,
          itemBuilder: (context, index) {
            return BookListItem(book: booklist[index]);
          }),
    );
  }
  @override
  Widget build(BuildContext context) {
    final BookFinderManager manager = GetIt.I.get<BookFinderManager>();
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Book Finder",
            style: Theme.of(context).primaryTextTheme.headline1),
        actions: [
          IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()));
                // GetIt.I.get<ThemeManager>().switchTheme();
              })
        ],
      ),
      body: _buildContent(context, manager)
    );
  }
}
