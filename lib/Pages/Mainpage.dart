import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubdemo/Bloc/UserBloc.dart';
import 'package:githubdemo/Bloc/UserEvents.dart';
import 'package:githubdemo/Bloc/UserStates.dart';
import 'package:githubdemo/Widget/Cardview.dart';

UserBloc _dataBloc;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    _dataBloc = BlocProvider.of<UserBloc>(context)..add(Fetch('https://api.github.com/users'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        if(state is UserLoaded){
          if (state.data.isEmpty) {
          return Center(
            child: Text('no posts'),
          );
        }
        return CardView(state.data);
        }
      }),
    );
  }
}
