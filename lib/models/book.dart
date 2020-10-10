
class Book{
  final String kind;
  final String id;
  final VolumeInfo volumeInfo;
  final String textSnippet;
  Book({this.textSnippet, this.kind, this.id, this.volumeInfo});

  factory Book.fromJson(Map<String, dynamic> json){
    return Book(
      kind: json["kind"],
      id: json["id"],
      //verify if json["searchInfo"] is null
      textSnippet: (json["searchInfo"]?? "")==""
          ?"" //if null, return empty string ""
          :(json["searchInfo"] as Map<String, dynamic>)["textSnippet"] ?? "",//else return textSnippet field
      volumeInfo: VolumeInfo.fromJson(json["volumeInfo"])
    );
  }

  String filter(){
    if(volumeInfo.description==""){
      return textSnippet.replaceAll(RegExp("<.+>|\&nbsp|[;\+]"), "");
    }
    return volumeInfo.description.replaceAll(RegExp("<.+>|\&nbsp|[;\+]"), "");
  }
}

class VolumeInfo{
  final String title;
  final List<String> authors;
  final String publisher;
  final String description;
  final ImageLinks imageLinks;

  VolumeInfo({this.publisher, this.description, this.imageLinks, this.title, this.authors});

  factory VolumeInfo.fromJson(Map<String, dynamic> json){
    return VolumeInfo(
      title: json["title"],
      authors: ((json["authors"] as List)?.map((e) => (e as String))?.toList()) ?? [],
      imageLinks: json["imageLinks"]==null
          ?null
          :ImageLinks.fromJson(json["imageLinks"]),
      description: json["description"] ?? "",
      publisher: json["publisher"]
    );
  }

}

class ImageLinks{
  final String smallThumbnail;
  final String thumbnail;

  ImageLinks({this.smallThumbnail, this.thumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json){
    return ImageLinks(
      thumbnail: (json["thumbnail"] as String).replaceAll("&edge=curl", ""),
      smallThumbnail: (json["smallThumbnail"] as String) ?? ""
    );
  }
}
