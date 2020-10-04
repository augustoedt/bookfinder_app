
class Book{
  final String kind;
  final String id;
  final VolumeInfo volumeInfo;
  // final String textSnippet;

  Book({this.kind, this.id, this.volumeInfo});

  factory Book.fromJson(Map<String, dynamic> json){
    return Book(
      kind: json["kind"],
      id: json["id"],
      volumeInfo: VolumeInfo.fromJson(json["volumeInfo"])
    );
  }
}

class VolumeInfo{
  final String title;
  final List<String> authors;
  final ImageLinks imageLinks;

  VolumeInfo({this.imageLinks, this.title, this.authors});

  factory VolumeInfo.fromJson(Map<String, dynamic> json){
    return VolumeInfo(
      title: json["title"],
      authors: (json["authors"] as List)?.map((e) => (e as String))?.toList(),
      imageLinks: ImageLinks.fromJson(json["imageLinks"])
    );
  }

}

class ImageLinks{
  final String smallThumbnail;
  final String thumbnail;

  ImageLinks({this.smallThumbnail, this.thumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json){
    return ImageLinks(
      smallThumbnail: json["smallThumbnail"],
      thumbnail: json["thumbnail"]
    );
  }
}
