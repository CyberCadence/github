import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Modeldata {



final int id;
final String name;
final String description;
final int stars;
final String username;
final String avatar_url;
  Modeldata({
    required this.id,
    required this.name,
    required this.description,
    required this.stars,
    required this.username,
    required this.avatar_url,
  });






  Map<String, dynamic> toMap() {
    return <String, dynamic>{

      'id':id,
      'name': name,
      'description': description,
      
      'stars': stars,
      'username': username,
      'image': avatar_url,
    };
  }

  factory Modeldata.fromMap(Map<String, dynamic> map) {
    return Modeldata(

      id: map['id']as int,
      name: map['name'] as String,
      description: map['description'] as String,
      stars: map['stargazers_count'] as int,
      username: map['full_name'] as String,
      avatar_url: map['owner'] ['avatar_url']as String,
    );
  }
 
}
