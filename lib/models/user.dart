class User{
  final String userPicUrl;
  final String name;
  final List<String> favorites;

  User({this.userPicUrl, this.name, this.favorites});

  Map<String, dynamic> toJson(){
    return {
      'userPicUrl': userPicUrl,
      'name': name,
      'favorites': favorites
    };
  }

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      userPicUrl: json['userPicUrl'],
      name: json['name'],
      favorites: (json['favorites'] as List)?.map((e) => e.toString())?.toList()
    );
  }

}