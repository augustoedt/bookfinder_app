import 'book.dart';

class BookSearch{
  String term;
  int totalItems;
  int maxResults;
  int startIndex = 0;
  List<Book> books;

  BookSearch({
    this.totalItems,
    this.startIndex,
    this.term
  }): maxResults = 10;

  factory BookSearch.copy(BookSearch search){
    return BookSearch(
      totalItems: search.totalItems,
      startIndex: search.startIndex,
      term: search.term
    );
  }

  String url(){
    return "https://www.googleapis.com/books/v1/volumes?q=${this.term}&maxResults=${this.maxResults}&startIndex=${this.startIndex}";
  }

  String urlnext(){
    startIndex +=10;
    return "https://www.googleapis.com/books/v1/volumes?q=${this.term}&startIndex=${this.startIndex}";
  }
}