import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubdemo/Bloc/home_bloc.dart';
import 'package:githubdemo/Model/UserList.dart';
import 'package:githubdemo/Widget/Profileview.dart';

HomeBloc _homeBloc;
class Profile extends StatefulWidget {
  final String url;

  Profile({Key key, this.url}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    print(widget.url);
    return new Scaffold(
        appBar: AppBar(title: Text('Profile')),
        body: BlocProvider(
          create: (context) => HomeBloc()..add(DataEvent(widget.url)),
          child: BlocListener<HomeBloc, DataState>(
            listener: (context, state) {
              if (state is DataFailed) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage)),
                );
              }
            },
            child: BlocBuilder(
              bloc: _homeBloc,
              builder: (BuildContext context, DataState state){
                  return _buildwidgetuserdata(state);
              }, 
            ),
          ),
        ));
  }

   Widget _buildwidgetuserdata(DataState state){
    if (state is DataLoading) {
      return Center(
        child: Platform.isAndroid
            ? CircularProgressIndicator()
            : CupertinoActivityIndicator(),
      );
    } else if(state is DataSuccess){
      Userlist data = state.data;
      return ProfileView(data);
    }
    else {
      return Container();
    }
  }
}


