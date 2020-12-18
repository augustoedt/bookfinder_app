class User{
  final bool isLogged;
  final String userImage;
  final String email;
  final String name;
  final List<String> favorites;

  const User({
    this.isLogged,
    this.userImage,
    this.email,
    this.name,
    this.favorites
  });

  factory User.empty(){
    return const User(
        isLogged: false,
        name: "no-user",
        email: "no-email",
        favorites: [],
        userImage: "no-image"
    );
  }

  factory User.fromJson(Map<String, dynamic> json){
    return User(
        name: json["name"] as String,
        email: json["email"] as String,
        favorites: (json["favorites"] as List).map((e) => e.toString()).toList(),
        userImage: json["userImage"] as String
    );
  }

  Map<String,dynamic> toJson(){
    return {
      "userImage" : userImage,
      "email": email,
      "name": name,
      "favorites": favorites
    };
  }

}