import 'package:flutter/material.dart';
import 'package:githubdemo/Model/UserList.dart';
import 'package:githubdemo/Pages/Followers.dart';
import 'package:githubdemo/Pages/Following.dart';
import 'package:intl/intl.dart';

class ProfileView extends StatelessWidget {
  final Userlist data;
  ProfileView(this.data);

  @override
  Widget build(BuildContext context) {
    var days =new DateFormat.yMd().add_jm().format(DateTime.parse(data.updated_at));
    print(days);

    return new Stack(
      children: <Widget>[
        ClipPath(
          child: Container(color: Colors.black.withOpacity(0.8)),
          clipper: getClipper(),
        ),
        Positioned(
            width: 350.0,
            top: MediaQuery.of(context).size.height / 7,
            child: Column(
              children: <Widget>[
                Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                            image: NetworkImage(data.avatar_url),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 7.0, color: Colors.black)
                        ])),
                SizedBox(height: 20.0),
                Text(
                  data.name,
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(height: 5.0),
                Text(
                  data.location==null?'Location':data.location,
                  style: TextStyle(
                      fontSize: 17.0,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                        height: 40.0,
                        width: 125.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 5.0,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Followers(data.followers_url)));
                            },
                            child: Center(
                              child: Text(
                                data.followers.toString() + ' Followers',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
                    Container(
                        height: 40.0,
                        width: 125.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.redAccent,
                          color: Colors.red,
                          elevation: 5.0,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Following(data.login)));
                            },
                            child: Center(
                              child: Text(
                                data.following.toString() +' Following',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                        text: TextSpan(
                            style:
                                TextStyle(fontSize: 20, color: Colors.black54),
                            children: <TextSpan>[
                          TextSpan(text: 'Userid :\t\t'),
                          TextSpan(
                              text: data.login,
                              style: TextStyle(color: Colors.teal))
                        ])),
                    SizedBox(height: 15.0),
                    RichText(
                        text: TextSpan(
                            style:
                                TextStyle(fontSize: 20, color: Colors.black54),
                            children: <TextSpan>[
                          TextSpan(text: 'Pubic Repos :\t\t'),
                          TextSpan(
                              text: data.public_repos.toString(),
                              style: TextStyle(color: Colors.teal))
                        ])),
                    SizedBox(height: 15.0),
                    RichText(
                        text: TextSpan(
                            style:
                                TextStyle(fontSize: 20, color: Colors.black54),
                            children: <TextSpan>[
                          TextSpan(text: 'Public gists :\t\t'),
                          TextSpan(
                              text: data.public_gists.toString(),
                              style: TextStyle(color: Colors.teal))
                        ])),
                    SizedBox(height: 15.0),
                    RichText(
                        text: TextSpan(
                            style:
                                TextStyle(fontSize: 20, color: Colors.black54),
                            children: <TextSpan>[
                          TextSpan(text: 'Updated at :\t\t'),
                          TextSpan(
                              text: days==null?'00/00/0000 00:00':days,
                              style: TextStyle(color: Colors.teal))
                        ])),
                  ],
                ),
              ],
            ))
      ],
    );
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 2.0);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
