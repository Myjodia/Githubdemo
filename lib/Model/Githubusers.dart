
import 'package:equatable/equatable.dart';

class Githubusers extends Equatable {
  final String login;
  final int id;
  final String nodeId;
  final String avatar_url;
  final String url;
  final String followers_url;
  final String following_url;

  const Githubusers({this.login,this.id,this.nodeId,this.avatar_url,this.url,this.followers_url,this.following_url});

  @override
  List<Object> get props => [login,id,nodeId,avatar_url,url];

}
