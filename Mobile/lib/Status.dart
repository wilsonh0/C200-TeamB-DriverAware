import 'dart:developer';
     
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

//Status
class Status extends StatefulWidget {
  @override
  Status1 createState() => Status1();
}

class Status1 extends State<Status> {
  var classification = "";
  List data;
  String url = 'https://c200-teamb-api.azurewebsites.net/api/ride_hours';
  Future<String> makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata;     
      
    });
  }

  @override
  void initState() {
    this.makeRequest();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ride Hours"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: new ListView.builder(
            itemCount: data == null? 0: data.length,
            itemBuilder: (BuildContext context, j) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: new ListTile(
                  title: new Text( data[j]['Date'],
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  subtitle: new Text("You had a drive of ",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  leading: new CircleAvatar(
                    backgroundImage: AssetImage('images/avatar1.jpg'),
                  ),
                  trailing: new CircleAvatar(
                      backgroundColor: Colors.pink[100],
                      child: Text(data[j]['Hours'],
                          style: TextStyle(
                              color: Colors.blue[800],
                              fontWeight: FontWeight.bold,
                              fontSize: 35))),
                ),
              );
            }),
      ),
    );
  }
}
