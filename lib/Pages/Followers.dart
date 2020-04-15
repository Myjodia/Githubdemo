

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubdemo/Bloc/UserBloc.dart';
import 'package:githubdemo/Bloc/UserEvents.dart';
import 'package:githubdemo/Bloc/UserStates.dart';
import 'package:githubdemo/Widget/FollowersCardView.dart';

UserBloc _dataBloc;
class Followers extends StatefulWidget {
  final String url;
  const Followers(this.url);

  @override
  _FollowersState createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Followers'),centerTitle: true),
        body: BlocProvider(
        create: (context) => UserBloc()..add(Fetch(widget.url)),
        child: Container(
          child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
            if (state is UserUninitialized) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserError) {
              return Center(
                child: Text('failed to fetch posts'),
              );
            }
            if (state is UserLoaded) {
              if (state.data.isEmpty) {
                return Center(
                  child: Text('no posts'),
                );
              }
              return FollowerCardView(state.data);
            }
          }),
        ),
      ),
    );
  }
}
