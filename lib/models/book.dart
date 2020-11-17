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
    Map<String, dynamic> volumeInfo = json['volumeInfo'] ?? {};
    Map<String, dynamic> imageLinks = volumeInfo['imageLinks'] ?? {};
    Map<String, dynamic> searchInfo = json['searchInfo'] ?? {};

    return Book(
      kind: json['kind'] ?? null,
      id: json['id'] ?? null,
      title: json['title'] ?? volumeInfo['title'] ?? null,
      authors: ((json['authors'] ?? volumeInfo['authors'] ?? []) as List).map((e) => e as String).toList(),
      publisher: json['publisher'] ?? volumeInfo['publisher'] ?? null,
      description: json['description'] ?? volumeInfo['description'] ?? null,
      smallThumbnail: json['smallThumbnail'] ?? imageLinks['smallThumbnail'] ?? null,
      thumbnail: json['thumbnail'] ?? imageLinks['thumbnail'] ?? null,
      textSnippet: json['textSnippet'] ?? searchInfo['textSnippet'] ?? null
    );
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> temp = {};
    if(kind!=null){temp.addAll({"kind": kind});}
    if(id!=null){temp.addAll({"id": id});}
    if(title!=null){temp.addAll({"title": title});}
    if(authors.length>0){temp.addAll({"authors": authors});}
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
      return textSnippet.replaceAll(RegExp("<.+>|\&nbsp|[;\+]"), "");
    }
    if(textSnippet == null && description == null) return "No description";

    return description;
  }
}