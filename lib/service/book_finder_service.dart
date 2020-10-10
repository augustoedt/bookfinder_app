import 'dart:convert';
import 'package:book_finder/models/book.dart';
import 'package:book_finder/models/book_search.dart';
import 'package:http/http.dart' as http;

class BookFinderService{

  static Future<BookSearch> browseBook(BookSearch search) async {
    var header = {"user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36"};
    print(getUrl(search));
    http.Response response = await http.get(getUrl(search), headers: header);
    var jsonResponse = json.decode(response.body);
    search.totalItems = jsonResponse["totalItems"] as int;
    var content = (jsonResponse["items"] as List);
    search.books = content.map((e) => Book.fromJson(e)).toList();
    return search;
  }



  static String getUrl(BookSearch bookSearch){
    String url = "https://www.googleapis.com/books/v1/volumes?q=";
    if(bookSearch.term != null && bookSearch.term != ""){
      url+=bookSearch.term;
    }
    if(bookSearch.searchType != null){
      url+="+${bookSearch.searchType}";
    }
    if(bookSearch.sorting != null){
      url+="&orderBy=${bookSearch.sorting}";
    }
    if(bookSearch.filter != null){
      url+="&filter=${bookSearch.filter}";
    }
    if(bookSearch.startIndex != null){
      url+="&startIndex=${bookSearch.startIndex.toString()}";
    }
    if(bookSearch.maxResults != null){
      url+="&maxResults=${bookSearch.maxResults.toString()}";
    }
    if(bookSearch.printType != null){
      url+="&printType=${bookSearch.printType}";
    }
    return url;
  }


}