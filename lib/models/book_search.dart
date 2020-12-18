import 'dart:typed_data';

import 'book.dart';

class BookSearch{
  String term;
  int totalItems;
  int maxResults;
  int startIndex = 0;
  String searchType;
  String sorting;
  String filter;
  String printType;
  List<Book> books;
  List<Uint8List> uThumbnais;
  BookSearch({
    this.totalItems,
    this.term,
    this.searchType,
    this.sorting,
    this.filter,
    this.printType
  }): maxResults = 10;

  factory BookSearch.empty(){
    return BookSearch();
  }

  factory BookSearch.params(BookSearch bookSearch){

    return BookSearch(
      term: bookSearch.term,
      searchType: bookSearch.searchType=="none"?null:bookSearch.searchType,
      sorting: bookSearch.sorting,
      filter: bookSearch.filter=="none"?null:bookSearch.filter,
      printType: bookSearch.printType=="none"?null:bookSearch.printType
    );
  }
}