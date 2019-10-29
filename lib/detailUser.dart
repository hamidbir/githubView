import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'DataModel/dUser.dart';

class DetailUser extends StatefulWidget {
  final String url;
  DetailUser({@required this.url});
  @override
  _DetailUserState createState() => _DetailUserState(hurl: url);
}

class _DetailUserState extends State<DetailUser> {
  final String hurl;
  _DetailUserState({this.hurl});
  Future<DUser> user;

  @override
  void initState() {
    super.initState();
    user = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/logo2.png'),
        ),
        title: Text(
          "GitHub View",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<DUser>(
        future: user,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(snapshot.data.avatarurl,
                          width: 120.0, height: 120.0),
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Public Repos',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Text(
                          '${snapshot.data.repos}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Followers',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Text(
                          '${snapshot.data.followers}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Following',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Text(
                          '${snapshot.data.following}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text('name: ${snapshot.data.name}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text('bio:${snapshot.data.bio}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text('location:${snapshot.data.location}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text('company:${snapshot.data.company}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text('blog:${snapshot.data.blog}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text('Email:${snapshot.data.email}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: GestureDetector(
                    child: Text('${snapshot.data.htmlurl}', style: TextStyle(color: Colors.blue,decoration: TextDecoration.underline),)),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            throw Exception('Failed to load user');
          }
          return CircularProgressIndicator();
        },
        /*  */
      ),
    );
  }

  Future<DUser> fetchUser() async {
    final response = await http.get(hurl);
    if (response.statusCode == 200) {
      return DUser.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user :( ');
    }
  }
}
