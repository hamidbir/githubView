import 'package:flutter/material.dart';

class DetailUser extends StatefulWidget {
  final String url;
  DetailUser({
   @required this.url 
  });


  
  @override
  _DetailUserState createState() => _DetailUserState();
}

class _DetailUserState extends State<DetailUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/logo2.png'),
        ),
        title: Text("GitHub View", style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.network(null),
                Column(
                  children: <Widget>[
                    Text('Public Repos',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                    Text('10',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,),textAlign: TextAlign.center,),
                  ],
                ),
                                Column(
                  children: <Widget>[
                    Text('Followers',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                    Text('40',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,),textAlign: TextAlign.center,),
                  ],
                ),
                                Column(
                  children: <Widget>[
                    Text('Follwing',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                    Text('0',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,),textAlign: TextAlign.center,),
                  ],
                ),
              ],
            ),
            Text('login:'),
            Text('bio:'),
            Text('location:'),
            Text('orginazition:'),
            Text('contact us:'),
          ],
        ),
      ),
      
    );
  }
}