import 'package:book_finder/manager/book_finder_manager.dart';
import 'package:book_finder/models/book.dart';
import 'package:book_finder/models/book_search.dart';
import 'package:book_finder/models/user.dart';
import 'package:book_finder/screens/settings_screen.dart';
import 'package:book_finder/service/user_service.dart';
import 'package:book_finder/widgets/book_list_item.dart';
import 'package:book_finder/widgets/search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

class BookFinder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BookFinderManager manager = GetIt.I.get<BookFinderManager>();
    return Scaffold(
      drawer: Drawer(
          child: FutureBuilder(
              future: UserService.loadLocalUser(),
              builder: (ctx, snapshot) {
                if (snapshot.hasData) {
                  User user = snapshot.data;
                  return ListView(
                    children: [
                      DrawerHeader(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            user.userPicUrl == ""
                                ? CircleAvatar(
                                    radius: 30,
                                    child: Icon(Icons.person),
                                    foregroundColor: Colors.lightBlueAccent,
                                  )
                                : CircleAvatar(
                                    child: Image.network(user.userPicUrl)),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(user.name),
                                  IconButton(
                                    icon: Icon(Icons.settings),
                                    onPressed: (){},
                                  )
                                ])
                          ],
                        ),
                        duration: Duration(milliseconds: 400),
                      ),
                      Column(
                        children: [
                          ListTile(
                            title: Text("Favorites"),
                          )
                        ],
                      )
                    ],
                  );
                }
                if (snapshot.hasError) {
                  print(snapshot.error.toString());
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return CircularProgressIndicator();
              })),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Book Finder",
            style: Theme.of(context).primaryTextTheme.headline1),
        actions: [
          IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()));
                // GetIt.I.get<ThemeManager>().switchTheme();
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
                    SearchTextField(bookSearch),
                    Expanded(
                      child: GridView.builder(
                          padding:
                              EdgeInsets.only(left: 12, right: 12, bottom: 12),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5,
                                  maxCrossAxisExtent: 140,
                                  childAspectRatio: 120 / 240),
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return BookListItem(book: list[index]);
                          }),
                    )
                  ],
                );
              }
              if (data is ErrorFBState) {
                return _initial();
              }
              return SearchTextField(BookSearch.empty());
            },
          )),
    );
  }

  Widget _initial() {
    return SearchTextField(BookSearch.empty());
  }

  Widget _loading() {
    return Center(child: CircularProgressIndicator());
  }
}
