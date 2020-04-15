import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubdemo/Model/Githubusers.dart';

class FollowerCardView extends StatelessWidget {
  final List data;
  FollowerCardView(this.data);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 5.0),
      itemCount: data.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        Githubusers userdata = data[index];
        return Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)),
          elevation: 3.0,
          margin: EdgeInsets.fromLTRB(8, 0, 8, 15),
          child: ListTile(
            leading: CachedNetworkImage(
              imageUrl: userdata.avatar_url == null
                  ? 'assets/images/img_not_found.jpg'
                  : userdata.avatar_url,
              imageBuilder: (context, imageProvider) {
                return Container(
                  height: 35.0,
                  width: 35.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              placeholder: (context, url) => Container(
                height: 35.0,
                width: 35.0,
                child: Center(
                  child: Platform.isAndroid
                      ? CircularProgressIndicator()
                      : CupertinoActivityIndicator(),
                ),
              ),
            ),
            title: Text(
              userdata.login.toUpperCase(),
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Baloo',
                  color: Colors.indigo[900]),
            ),
            subtitle: Text(userdata.id.toString()==null?'':userdata.id.toString(),style: TextStyle(color: Colors.black,fontSize: 13))
          ),
        );
      },
    );
  }
}
