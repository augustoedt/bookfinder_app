import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ImageService{
  static Future<Uint8List> saveImageAndReturnUint8List(String key, String url) async {
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey("img_$key")) {
      prefs.remove("img_$key");
      prefs.remove("img_$url");
      final httpClient = HttpClient();
      final request = await httpClient.getUrl(Uri.parse(url));
      final response = await request.close();
      final bytes = await consolidateHttpClientResponseBytes(response);
      final imageString = encodeImageToString(bytes);
      prefs.setString("img_$key", imageString);
      return bytes;
    }
    print("image_from_cache");
    return decodeImageFromString(prefs.getString("img_$key"));
  }

  static Future<bool> saveImageToPrefs(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  static Future<bool> deleteImageFromPrefs(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove(key);
  }

  static Future<bool> emptyPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  static Future<bool> existImageInPrefs(String key) async{
    final prefs =  await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  static Future<Uint8List> loadImageFromPrefs(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return decodeImageFromString(prefs.getString(key));
  }

  // encodes bytes list as string
  static String encodeImageToString(Uint8List data) {
    return base64Encode(data);
  }

  // decode bytes from a string
  static Uint8List decodeImageFromString(String base64String) {
    return base64Decode(base64String);
  }
}