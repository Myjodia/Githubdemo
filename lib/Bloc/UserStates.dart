import 'package:equatable/equatable.dart';
import 'package:githubdemo/Model/Githubusers.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserUninitialized extends UserState {}

class UserError extends UserState {}

class UserLoaded extends UserState {
  final List<Githubusers> data;

  const UserLoaded({
    this.data,
  });

  UserLoaded copyWith({
    List<Githubusers> data,
  }) {
    return UserLoaded(
      data: data ?? this.data,
    );
  }

  @override
  List<Object> get props => [data];

  @override
  String toString() =>
      'UserLoaded { posts: ${data.length}}';
}
