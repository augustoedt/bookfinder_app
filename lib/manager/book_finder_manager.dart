import 'dart:async';
import 'package:book_finder/models/book.dart';
import 'package:book_finder/models/book_search.dart';
import 'package:book_finder/service/book_finder_service.dart';
import 'package:rxdart/rxdart.dart';

class BookFinderManager{

  final PublishSubject _controller = PublishSubject<BFState>();
  Stream<BFState> get finder$ => _controller.stream;

  void search(BookSearch search) async {

    _controller.add(LoadingBFState());
    Future.delayed(Duration(seconds: 2));
    await BookFinderService.browseBook(search.url())
        .then((bookList) => _controller.add(LoadedBFState(bookList, search)))
        .catchError((error){
          print(error.toString());
          _controller.add(ErrorFBState());
        });
  }

  void nextPage(BookSearch search) async {
    List<Book> _books = await BookFinderService.browseBook(search.urlnext());
    print(_books.length);
    // _controller.add(_books);
  }

  void dispose(){
    _controller.close();
  }

}

abstract class BFState{
  const BFState();
}

class InitialBFState extends BFState{
  const InitialBFState();
}

class LoadingBFState extends BFState{
  const LoadingBFState();
}

class LoadedBFState extends BFState{
  final BookSearch search;
  final List<Book> book;
  const LoadedBFState(this.book, this.search);
}

class ErrorFBState extends BFState{
  const ErrorFBState();
}