import 'dart:convert';
import 'package:book_finder/models/book.dart';
import 'package:book_finder/models/book_search.dart';
import 'package:http/http.dart' as http;

class BookFinderService{

  static Future<BookSearch> browseBook(BookSearch search) async {
    var header = {"user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36"};
    print(search.url());
    http.Response response = await http.get(search.url(), headers: header);
    var jsonResponse = json.decode(response.body);
    search.totalItems = jsonResponse["totalItems"] as int;
    var content = (jsonResponse["items"] as List);
    search.books = content.map((e) => Book.fromJson(e)).toList();
    return search;
  }



}