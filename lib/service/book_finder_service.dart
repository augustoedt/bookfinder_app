import 'dart:convert';
import 'package:book_finder/models/book.dart';
import 'package:http/http.dart' as http;

class BookFinderService{
  static const String urlTest="https://www.googleapis.com/books/v1/volumes?q=flowers+inauthor";

  static Future<List<Book>> browseBook(String url) async {
    http.Response response = await http.get(url);
    var jsonResponse = json.decode(response.body);
    var content = (jsonResponse["items"] as List);
    Iterable<Book> _books = content.map((e) => Book.fromJson(e)).toList();
    return _books;
  }



}