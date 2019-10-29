import 'package:flutter/material.dart';
import 'package:githbview/detailUser.dart';
import 'package:githbview/history.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MaterialApp(
      theme: ThemeData(primaryColor: Colors.black),
      home: Homepage(),
    ));

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Icon searchIcon = Icon(Icons.search);
  Widget titleBar = Text('Github View',
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold));
  TextEditingController seacrhControll = new TextEditingController();

  String name;
  String helpUrl;
  final String mainUrl = "https://api.github.com/search/users?q=";
  List data = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: titleBar,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/logo2.png',
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: searchIcon,
            onPressed: () {
              setState(() {
                if (this.searchIcon.icon == Icons.search) {
                  this.searchIcon = Icon(Icons.close);
                  this.titleBar = new TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: 'Enter',
                      prefixIcon: Icon(Icons.search),
                    ),
                    controller: seacrhControll,
                  );

                } else {
                  this.searchIcon = Icon(Icons.search);
                  this.titleBar = Text('Github View',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold));
                          seacrhControll.clear();
                }

              });
            },
          ),
          MaterialButton(
            color: Colors.black,
            onPressed: (){
              setState(() {
               name = seacrhControll.text;
               helpUrl = mainUrl;
               helpUrl += name; 
              });
              getjsonData();
              
            },
            child: Text('Go',style:TextStyle(color: Colors.white)),
          )
        ],
      ),
         body: ListView.builder(
        itemCount: data == null ? 0:data.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>DetailUser(url:data[index]['url'])));
            },
            title: Text(data[index]['login']),
            leading: CircleAvatar(
              child: Image.network(data[index]['avatar_url']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context)=>History()));
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.history,color: Colors.white,),
      ),
    );
  }
   Future<String> getjsonData() async {
  var response = await http.get(
    Uri.encodeFull(helpUrl),
  );
  setState(() {
   var convertDataToJson =  json.decode(response.body);
   data = convertDataToJson['items'];


  });
return "Success";

}
}

