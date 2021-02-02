import 'package:flutter/material.dart';

//Home Page With four buttons
class LoginAsUser extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Image.network(
                    'https://media1.giphy.com/media/l4Ho7AfNzHCtwGR0s/giphy.gif?cid=ecf05e47zylftbi12z49ym9u0th3ctrxzuduznvy3fn51h3d&rid=giphy.gif'),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      margin: const EdgeInsets.only(top: 100.0),
                      child: RaisedButton(
                        shape: StadiumBorder(),
                        child: Text("Ride Hours"),
                        color: Colors.greenAccent,
                        onPressed: () {
                          Navigator.pushNamed(context, '/Status');
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RaisedButton(
                    shape: StadiumBorder(),
                    child: Text("Status"),
                    color: Colors.greenAccent,
                    onPressed: () {
                      Navigator.pushNamed(context, '/TimesSlept');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RaisedButton(
                    shape: StadiumBorder(),
                    child: Text("Recommendations"),
                    color: Colors.greenAccent,
                    onPressed: () {
                      Navigator.pushNamed(context, '/Reccomendations');
                    },
                  ),
                ),
              ],
            ),
        ),
        ),
      ),
    );
  }
}
