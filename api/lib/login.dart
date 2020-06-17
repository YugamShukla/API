import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  final TextEditingController _userController = new TextEditingController();

  final String url = "http://3.21.202.26:8080/tapitserver/user/email?email=";
  List data;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        centerTitle: true,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(top: 100.0),
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _userController,
                    decoration: new InputDecoration(
                        hintText: 'Enter Email',
                       ),
                  ),

                  new Padding(padding: new EdgeInsets.all(10.5)), //add padding

                  new Center(
                    // Login button

                    child: new RaisedButton(
                      onPressed: () {
                        getSWData(_userController.text.toString());
                      },
                      color: Colors.green,
                      child: new Text("Login"),
                      // Clear button
                    ),
                  )
                ],
              ),
            ), //form ends here

            new Padding(padding: const EdgeInsets.all(14.0)),
          ],
        ),
      ),
    );
  }

  Future<String> getSWData(String email) async {
    
    var res = await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    print("response" + "$url");
    setState(() {
      var resBody = json.decode(res.body);
      print("response" + "$resBody");
    });
    return "succees";
  }
}
