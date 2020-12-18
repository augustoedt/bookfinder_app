import 'dart:typed_data';

import 'package:book_finder/service/image_service.dart';

class Book{
  final String kind;
  final String id;
  final String title;
  final List<String> authors;
  final String publisher;
  final String description;
  final String smallThumbnail;
  final String thumbnail;
  final String textSnippet;

  Book({
    this.kind,
    this.id,
    this.title,
    this.authors,
    this.publisher,
    this.description,
    this.smallThumbnail,
    this.thumbnail,
    this.textSnippet
  });

  factory Book.fromJson(Map<String,dynamic> json){
    final volumeInfo = json['volumeInfo'] as Map<String, dynamic> ?? {};
    final imageLinks = volumeInfo['imageLinks'] as Map<String, dynamic> ?? {};
    final searchInfo = json['searchInfo'] as Map<String, dynamic> ?? {};

    return Book(
      kind: json['kind'] as String,
      id: json['id'] as String,
      title: json['title'] as String ?? volumeInfo['title'] as String,
      authors: ((json['authors'] ?? volumeInfo['authors'] ?? []) as List).map((e) => e as String).toList(),
      publisher: json['publisher'] as String ?? volumeInfo['publisher'] as String,
      description: json['description'] as String ?? volumeInfo['description'] as String,
      smallThumbnail: json['smallThumbnail'] as String ?? imageLinks['smallThumbnail'] as String,
      thumbnail: json['thumbnail'] as String ?? imageLinks['thumbnail'].replaceAll("&edge=curl", "") as String,
      textSnippet: json['textSnippet'] as String ?? searchInfo['textSnippet'] as String
    );
  }

  Map<String, dynamic> toJson(){
    Map<String,dynamic> temp = {} as Map<String,dynamic>;
    if(kind!=null){temp.addAll({"kind": kind});}
    if(id!=null){temp.addAll({"id": id});}
    if(title!=null){temp.addAll({"title": title});}
    if(authors.isNotEmpty){temp.addAll({"authors": authors});}
    if(publisher!=null){temp.addAll({"publisher": publisher});}
    if(description!=null){temp.addAll({"description": description});}
    if(smallThumbnail!=null){temp.addAll({"smallThumbnail": smallThumbnail});}
    if(thumbnail!=null){temp.addAll({"thumbnail": thumbnail});}
    if(textSnippet!=null){temp.addAll({"textSnippet": textSnippet});}
    return temp;
  }

  String filterThumbnail(){
    if(thumbnail!=null) {
      return thumbnail.replaceAll("&edge=curl", "");
    }
    return null;
  }
  String filterDescription() {
    if (description == null && textSnippet != null) {
      return textSnippet.replaceAll(RegExp("<.+>|&nbsp|[;+]"), "");
    }
    if(textSnippet == null && description == null) return "No description";

    return description;
  }
}