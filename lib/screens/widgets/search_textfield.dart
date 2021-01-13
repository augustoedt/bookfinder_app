import 'package:book_finder/manager/book_finder_manager.dart';
import 'package:book_finder/models/book_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';

class SearchTextField extends StatefulWidget {
  BookSearch bookSearch;
  BuildContext context;

  SearchTextField(this.bookSearch, this.context);

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

  Widget _buildRow(List<String> values,
      {Widget child, void Function(String) onSelected}) {
    return Row(
      children: [
        child,
        PopupMenuButton<String>(
            onSelected: onSelected,
            itemBuilder: (context) => values
                .map<PopupMenuItem<String>>((e) {
                  return PopupMenuItem(
                    value: e.toLowerCase(),
                    child: Text(e),
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
        const SizedBox(height: 8),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 8,
                child: SizedBox(
                    width: 350,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          term = value;
                        });
                      },
                      onSubmitted: (value) {
                        widget.bookSearch.term = value;
                        manager.search(BookSearch.params(widget.bookSearch));
                      },
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: () {
                              widget.bookSearch.term = term;
                              manager
                                  .search(BookSearch.params(widget.bookSearch));
                              // manager.search(BookSearch(term: value));
                            },
                            icon: const Icon(Icons.search),
                          )),
                    )),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 30),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      showOptions = !showOptions;
                    });
                  },
                  child: const Center(child: Icon(Icons.more_vert)),
                ),
              )
            ],
          ),
          subtitle: showOptions
              ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: _buildRow(['relevance', 'newest'],
                    child: Text(widget.bookSearch.sorting ?? "relevance"),
                    onSelected: (value) {
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
                    ], child: Text(widget.bookSearch.filter ?? "none"),
                        onSelected: (value) {
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
                        child: Text(widget.bookSearch.searchType ?? "none"),
                        onSelected: (value) {
                      setState(() {
                        widget.bookSearch.searchType = value;
                      });
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: _buildRow(['none', 'all', 'books', 'magazines'],
                        child: Text(widget.bookSearch.printType ?? "none"),
                        onSelected: (value) {
                      setState(() {
                        widget.bookSearch.printType = value;
                      });
                    }),
                  ),
                ])
              : Container(),
        ),
        if (widget.bookSearch.term != null) SizedBox(
                width: 200,
                height: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: () {
                        manager.searchLeftNavigate(widget.bookSearch);
                      },
                      iconSize: 12,
                    ),
                    Text(
                        "${widget.bookSearch.startIndex + widget.bookSearch.maxResults}/${widget.bookSearch.totalItems}"),
                    IconButton(
                      icon: const Icon(Icons.chevron_right),
                      onPressed: () {
                        manager.searchRightNavigate(widget.bookSearch);
                      },
                      iconSize: 12,
                    )
                  ],
                ),
              ) else Container(),
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
