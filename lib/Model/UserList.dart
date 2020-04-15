import 'package:json_annotation/json_annotation.dart';
part 'UserList.g.dart';

@JsonSerializable()
class Userlist{

  String login;
  String name;
  String location;
  int id;
  int followers;
  int following;
  int public_repos;
  int public_gists;
  String updated_at;
  String node_id;
  String avatar_url;
  String url;
  String followers_url;
  String following_url;
  String bio;

  Userlist(this.login,this.name,this.location,this.id,this.followers,this.following,this.public_repos,this.public_gists,this.updated_at,
  this.node_id,this.avatar_url,this.url,this.followers_url,this.following_url,this.bio);

  factory Userlist.fromJson(Map<String, dynamic> json) => _$UserlistFromJson(json);

  Map<String, dynamic> toJson() => _$UserlistToJson(this);

}