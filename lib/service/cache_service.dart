import 'dart:convert';

import 'package:book_finder/models/book.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static void saveBook({
    Book book,
    String path = ""
  }) async {
    String id = book.id;
    String bookContent = json.encode(book.toJson());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> bookList = [];
    if (path == "") {
      bookList = prefs.getStringList("bookList");
    } else {
      bookList = prefs.getStringList(path);
    }
    bookList.add(bookContent);
  }
}
