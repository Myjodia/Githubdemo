import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubdemo/Model/Githubusers.dart';
import 'package:githubdemo/Pages/Profile.dart';

class CardView extends StatelessWidget {
  final List data;
  CardView(this.data);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ListView.builder(
        padding: EdgeInsets.only(top: 5.0),
        itemCount: data.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          Githubusers userdata = data[index];
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            elevation: 5.0,
            margin: EdgeInsets.fromLTRB(8, 0, 8, 15),
            child: ListTile(
              leading: CachedNetworkImage(
                imageUrl: userdata.avatar_url == null
                    ? 'assets/images/img_not_found.jpg'
                    : userdata.avatar_url,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                placeholder: (context, url) => Container(
                  height: 40.0,
                  width: 40.0,
                  child: Center(
                    child: Platform.isAndroid
                        ? CircularProgressIndicator()
                        : CupertinoActivityIndicator(),
                  ),
                ),
              ),
              title: Center(
                child: Text(
                  userdata.login.toUpperCase(),
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Baloo',
                      color: Colors.indigo[900]),
                ),
              ),
              subtitle: Center(child: Text(userdata.nodeId==null?'':userdata.nodeId,style: TextStyle(color: Colors.black),)),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
              context, MaterialPageRoute(builder: (context) => Profile(url:userdata.url)));
              },
            ),
          );
        },
      ),
    );
  }
}
