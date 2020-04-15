import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubdemo/Bloc/UserBloc.dart';
import 'package:githubdemo/Bloc/UserEvents.dart';
import 'package:githubdemo/Bloc/UserStates.dart';
import 'package:githubdemo/Widget/FollowersCardView.dart';

UserBloc _dataBloc;

class Following extends StatefulWidget {
  final String url;
  const Following(this.url);

  @override
  _FollowingState createState() => _FollowingState();
}

class _FollowingState extends State<Following> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Following')),
      body: BlocProvider(
        create: (context) => UserBloc()..add(Fetch('https://api.github.com/users/'+widget.url+'/following')),
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
