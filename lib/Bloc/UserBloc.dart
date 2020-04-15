import 'dart:async';
import 'dart:convert';

import 'package:githubdemo/Bloc/UserEvents.dart';
import 'package:githubdemo/Bloc/UserStates.dart';
import 'package:githubdemo/Model/Githubusers.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final http.Client httpClient=new http.Client();

  // UserBloc({@required this.httpClient});

  @override
  get initialState => UserUninitialized();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    final currentState = state;
    if (event is Fetch) {
      try {
        if (currentState is UserUninitialized) {
          
          final data = await _fetchPosts(event.url);
          yield UserLoaded(data: data);
          return;
        }
        if (currentState is UserLoaded) {
          final data = await _fetchPosts(event.url);
          yield data.isEmpty
              ? null
              : UserLoaded(data: currentState.data);
        }
      } catch (_) {
        yield UserError();
      }
    }
  }

  // bool _hasReachedMax(UserState state) =>state is UserLoaded;

  Future<List<Githubusers>> _fetchPosts(String url) async {
    final response = await httpClient.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((rawPost) {
        return Githubusers(
          id: rawPost['id'],
          nodeId: rawPost['node_id'],
          login: rawPost['login'],
          avatar_url: rawPost['avatar_url'],
          url: rawPost['url'],
        );
      }).toList();
    } else {
      throw Exception('error fetching posts');
    }
  }
}
