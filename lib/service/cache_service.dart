import 'dart:convert';

import 'package:book_finder/models/book.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static Future<bool> saveBook({
    Book book,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey("book_${book.id}")) {
      final bookContent = json.encode(book.toJson());
      return prefs.setString("book_${book.id}", bookContent);
    }
    return false;
  }
  static Future<bool> checkFavorite(String id) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey("book_$id");
  }

}
