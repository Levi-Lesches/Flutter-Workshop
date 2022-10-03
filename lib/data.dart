class User {
  final int id;
  final String name;
  final String email;
  
  User({
    required this.id, 
    required this.name, 
    required this.email,
  });
  
  User.fromJson(Map json) : 
    id = json["id"],
    email = json["email"],
    name = json["name"];
}
