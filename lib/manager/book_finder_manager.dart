import 'dart:async';

import 'package:book_finder/models/book.dart';
import 'package:book_finder/models/book_search.dart';
import 'package:book_finder/service/book_finder_service.dart';

class BookFinderManager{

  StreamController<List<Book>> _controller = StreamController<List<Book>>();
  Stream<List<Book>> get finder$ => _controller.stream;

  void finder(BookSearch search) async {
    List<Book> _books = await BookFinderService.browseBook(search.url());
    print(_books.length);
    _controller.add(_books);
  }

  void nextPage(BookSearch search) async {
    List<Book> _books = await BookFinderService.browseBook(search.urlnext());
    print(_books.length);
    _controller.add(_books);
  }




  
  void dispose(){
    _controller.close();
  }

}