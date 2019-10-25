import 'package:flutter/material.dart';
void main() =>runApp(MaterialApp(
  theme:
  ThemeData(
    primaryColor: Colors.black
  ),
  home: homepage(),
  ));
  
class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  Icon searchIcon = Icon(Icons.search);
  Widget titleBar = Text('Github View',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold));
  TextEditingController seacrhControll = new TextEditingController();

  String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: titleBar,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/logo2.png',),
        ),
        actions: <Widget>[
          IconButton(
            icon: searchIcon,
            onPressed: (){
              setState(() {
               if(this.searchIcon.icon == Icons.search){
                 this.searchIcon = Icon(Icons.close);
                 this.titleBar = TextField(
                   style: TextStyle(color: Colors.white),
                   decoration: InputDecoration(
                     hintStyle: TextStyle(color: Colors.grey),
                     hintText: 'Enter',
                     prefixIcon: Icon(Icons.search),
                   ),
                   controller:seacrhControll,
                 );
                 MaterialButton(
                   color: Colors.black,
                   onPressed: (){
                     name = seacrhControll.text;
                   },
                   child: Text('Go'),
                 );

               } 
              });
            },

          )
        ],
      ),
      
    );
  }
}