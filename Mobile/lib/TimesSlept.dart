import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/src/widgets/table.dart';
//No Of Times Slept

class TimesSlept extends StatefulWidget {
  @override
  TimesSlept1 createState() => TimesSlept1();
}

class TimesSlept1 extends State<TimesSlept> {
  var date_lst = new List();
  var hours_lst = new List();
  var data;
  var drowsy_lst = new List();
  var all_data;  
  var yawn_lst = new List();
  var close_lst = new List();
  int lengthi;
  int count =0;
  String url = 'https://c200-teamb-api.azurewebsites.net/api/drowsydetections';

  Future<String> doRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    
    setState(() {
      var extractdata = json
          .decode(response.body); //the data is extracted from the json fromat
      
      all_data = extractdata;
      lengthi = all_data.length;
      //adding the username and passwords from database to two lists.
      for (int i = 0; i < lengthi; i++) {
        data = all_data[i];
       var date = data['timestamp'].split('T');
       if(data['drowsy'] == true)
        {        
        date_lst.add(date);
        count +=1;
        if(data['yawn']>0){
          yawn_lst.add('did');
          
        }
        else{
          yawn_lst.add('did not');
        }
        if(data['eyesClosed']>0){
          close_lst.add('did');
        }
        else{
          close_lst.add('did not');
        }
        }     
        
      }
           
    });
  }
   
  @override
  void initState() {
    this.doRequest();
  }

  // List data;
  
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Status"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
             Image.network(
                'https://media4.giphy.com/media/3o6Zt20M3uA972k3gQ/giphy.gif?cid=ecf05e47ln76u7j3hm73oagwekjovl8fykol5snher87pfdy&rid=giphy.gif',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Table(
                  defaultColumnWidth: FixedColumnWidth(200.0),
                  border: TableBorder.all(
                      color: Colors.yellow[100],
                      style: BorderStyle.solid,
                      width: 5),
                  children: [
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(children: [
                          Text('DATE AND TIME',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.amber[200]))
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(children: [
                          Text('STATUS',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.amber[200]))
                        ]),
                      ),
                    ]),
                    (TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(children: [
                          Text((date_lst.length > 0) ? 'Date: ' + date_lst[(count-1)][0] + '\n\nTime: ' + date_lst[(count-1)][1]  : 'loading', 
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))
                                  
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(children: [
                          Text((yawn_lst.length > 0) ? 'You '+ yawn_lst[count-1] + ' yawn.\nYou '+ close_lst[count-1] +" close eyes." : 'loading',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))
                        ]),
                      ),
                    ])),
                   (TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(children: [
                          Text((date_lst.length > 0) ? 'Date: ' + date_lst[(count-2)][0] + '\n\nTime: ' + date_lst[(count-2)][1] : 'loading',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(children: [
                          Text((yawn_lst.length > 0) ? 'You '+ yawn_lst[count-1] + ' yawn.\nYou '+ close_lst[count-2] +" close eyes." : 'loading',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))
                        ]),
                      ),
                    ])),
                     (TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(children: [
                          Text((date_lst.length > 0) ? 'Date: ' + date_lst[(count-3)][0] + '\n\nTime:' + date_lst[(count-3)][1] : 'loading',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(children: [
                          Text((yawn_lst.length > 0) ? 'You '+ yawn_lst[count-1] + ' yawn.\nYou '+ close_lst[count-3] +" close eyes." : 'loading',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))
                        ]),
                      ),
                    ])),
                     (TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(children: [
                          Text((date_lst.length > 0) ? 'Date: ' + date_lst[(count-4)][0] + '\n\nTime: ' + date_lst[(count-4)][1] : 'loading',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(children: [
                          Text((yawn_lst.length > 0) ? 'You '+ yawn_lst[count-1] + ' yawn.\nYou '+ close_lst[count-4] +" close eyes." : 'loading',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))
                        ]),
                      ),
                    ])),                     
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
