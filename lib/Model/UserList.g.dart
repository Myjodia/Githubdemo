// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Userlist _$UserlistFromJson(Map<String, dynamic> json) {
  return Userlist(
    json['login'] as String,
    json['name'] as String,
    json['location'] as String,
    json['id'] as int,
    json['followers'] as int,
    json['following'] as int,
    json['public_repos'] as int,
    json['public_gists'] as int,
    json['updated_at'] as String,
    json['node_id'] as String,
    json['avatar_url'] as String,
    json['url'] as String,
    json['followers_url'] as String,
    json['following_url'] as String,
    json['bio'] as String,
  );
}

Map<String, dynamic> _$UserlistToJson(Userlist instance) => <String, dynamic>{
      'login': instance.login,
      'name': instance.name,
      'location': instance.location,
      'id': instance.id,
      'followers': instance.followers,
      'following': instance.following,
      'public_repos': instance.public_repos,
      'public_gists': instance.public_gists,
      'updated_at': instance.updated_at,
      'node_id': instance.node_id,
      'avatar_url': instance.avatar_url,
      'url': instance.url,
      'followers_url': instance.followers_url,
      'following_url': instance.following_url,
      'bio': instance.bio,
    };
