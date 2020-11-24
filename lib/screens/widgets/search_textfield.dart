import 'package:book_finder/manager/book_finder_manager.dart';
import 'package:book_finder/models/book_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';

class SearchTextField extends StatefulWidget {
  BookSearch bookSearch;

  SearchTextField(this.bookSearch);

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  bool showOptions = false;
  String sorting = "relevance";
  String filter = "none";
  String printType = "none";
  String searchType = "none";
  String term;

  Widget _buildRow(List<String> values, {Widget child, Function onSelected}) {
    return Row(
      children: [
        child,
        PopupMenuButton<String>(
            onSelected: onSelected,
            itemBuilder: (context) => values.map<PopupMenuItem<String>>((e) {
                  return PopupMenuItem(
                    child: Text(e),
                    value: e.toLowerCase(),
                  );
                }).toList())
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final BookFinderManager manager = GetIt.I.get<BookFinderManager>();
    return Center(
        child: Column(
      children: [
        SizedBox(
          height: 8,
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 8,
                child: Container(
                    width: 350,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          term = value;
                        });
                      },
                      onSubmitted: (value) {
                        print("Submitted");
                        widget.bookSearch.term = value;
                        manager.search(BookSearch.params(widget.bookSearch));
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: () {
                              print("Icon Submit");
                              widget.bookSearch.term = term;
                              manager
                                  .search(BookSearch.params(widget.bookSearch));
                              // manager.search(BookSearch(term: value));
                            },
                            icon: Icon(Icons.search),
                          )),
                    )),
              ),
              Expanded(
                  flex: 1,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        showOptions = !showOptions;
                      });
                    },
                    child: Center(child: Icon(Icons.more_vert)),
                  ))
            ],
          ),
          subtitle: showOptions
              ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: _buildRow(['relevance', 'newest'],
                        child: Text(widget.bookSearch.sorting == null
                            ? "relevance"
                            : widget.bookSearch.sorting), onSelected: (value) {
                      setState(() {
                        widget.bookSearch.sorting = value;
                      });
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: _buildRow([
                      'none',
                      'full',
                      'free-ebooks',
                      'paid-ebooks',
                      'ebooks'
                    ],
                        child: Text(widget.bookSearch.filter == null
                            ? "none"
                            : widget.bookSearch.filter), onSelected: (value) {
                      setState(() {
                        widget.bookSearch.filter = value;
                      });
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: _buildRow([
                      'none',
                      'intitle',
                      'inauthor',
                      'inpublisher',
                      'subject',
                      'isbn'
                    ],
                        child: Text(widget.bookSearch.searchType == null
                            ? "none"
                            : widget.bookSearch.searchType),
                        onSelected: (value) {
                      setState(() {
                        widget.bookSearch.searchType = value;
                      });
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: _buildRow(['none', 'all', 'books', 'magazines'],
                        child: Text(widget.bookSearch.printType == null
                            ? "none"
                            : widget.bookSearch.printType),
                        onSelected: (value) {
                      setState(() {
                        widget.bookSearch.printType = value;
                      });
                    }),
                  ),
                ])
              : Container(),
        ),
        widget.bookSearch.term != null
            ? Container(
                width: 200,
                height: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.chevron_left),
                      onPressed: () {
                        manager.searchLeftNavigate(widget.bookSearch);
                      },
                      iconSize: 12,
                    ),
                    Text(
                        "${widget.bookSearch.startIndex + widget.bookSearch.maxResults}/${widget.bookSearch.totalItems}"),
                    IconButton(
                      icon: Icon(Icons.chevron_right),
                      onPressed: () {
                        manager.searchRightNavigate(widget.bookSearch);
                      },
                      iconSize: 12,
                    )
                  ],
                ),
              )
            : Container(),
      ],
    ));
  }

  String fieldFilter(String field) {
    if (field == 'none') {
      return null;
    }
    return field;
  }
}
