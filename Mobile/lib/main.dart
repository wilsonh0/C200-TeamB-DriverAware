import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'LoginAsUser.dart';
import 'Status.dart';
import 'TimesSlept.dart';
import 'Reccomendations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BaseApp(),
      routes: <String, WidgetBuilder>{
        '/LoginAsUser': (context) => LoginAsUser(),
        '/Status': (context) => Status(),
        '/Reccomendations': (context) => Reccomendations(),
        '/TimesSlept': (context) => TimesSlept(),
      },
    );
  }
}

class BaseApp extends StatefulWidget {
  @override
  Baseapp1 createState() => Baseapp1();
}

class Baseapp1 extends State<BaseApp> {
  final _controller = TextEditingController();
  final _controlee = TextEditingController();
  String userin = "";
  String passin = "";
 
  var user_lst = new List();
  var pass_lst = new List();
  var data;
  var all_data;
  int length;
  String url = 'https://c200-teamb-api.azurewebsites.net/api/Users';
  Future<String> makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      var extractdata = json
          .decode(response.body); //the data is extracted from the json fromat
      all_data = extractdata;
      length = all_data.length;
      //adding the username and passwords from database to two lists.
      for (int i = 0; i < extractdata.length; i++) {
        data = all_data[i];
        user_lst.add(data['username']);
        pass_lst.add(data['password']);
      }
      print(user_lst);
    });
  }

  //Login Page

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DRIVE"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/IMG_3085.JPG'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //Image.asset('images/logo.png'),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_box),
                        hintText: 'Username',
                        border: OutlineInputBorder()),
                    style: TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 18.0,
                    ),
                    controller: _controller,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: 'Password',
                        border: OutlineInputBorder()),
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 18.0,
                    ),
                    controller: _controlee,
                  ),
                ),
                FlatButton(
                  child: Text("Sign In"),
                  color: Colors.green,
                  onPressed: () {
                    this.makeRequest();
                    userin = _controller.text;
                    passin = _controlee.text;
                    for (int i = 0; i < user_lst.length; i++) {
                      //checks the entered passwords is correct using for loop.
                      if (userin == user_lst[i] && passin == pass_lst[i]) {
                        user_lst.clear();
                        pass_lst.clear();
                        Navigator.pushReplacementNamed(context, '/LoginAsUser');
                      }
                    }
                    user_lst.clear();
                    pass_lst.clear();
                  },
                ),
                FlatButton(
                  child: Text("Sign UP"),
                  color: Colors.red[400],
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
