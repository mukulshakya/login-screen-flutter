import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String _welcomeString = "";

  void _clearField() {
    setState(() {
      _userController.clear();
      _passwordController.clear();
      _welcomeString = "Unknown";
    });
  }
  void _loginField() {
    setState(() {
      if(_userController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
        _welcomeString = _userController.text;
      }
      else {
        _welcomeString = "Unknown";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.deepOrange,
          title: new Text("Login App"),
          centerTitle: true,
        ),
        body: new Container(
          color: Colors.blueGrey.shade300,
          alignment: Alignment.center,
          child: new Column(
            children: <Widget>[
              new Padding(padding: EdgeInsets.only(top: 5)),
              new Image.asset(
                "images/face.png",
                width: 90.0,
                height: 90.0,
                color: Colors.white,
              ),
              new Padding(padding: EdgeInsets.only(top: 5)),
              new Container(
                margin: new EdgeInsets.only(left: 40, right: 40),
                decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(width: 5.0, color: Colors.deepOrange)),
                width: 410.0,
                height: 160.0,
                child: new Column(
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.only(left: 10, right: 20),
                      child: new TextField(
                        controller: _userController,
                        decoration: new InputDecoration(
                            hintText: "Enter Username",
                            icon: new Icon(Icons.supervised_user_circle)),
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(left: 10, right: 20),
                      child: new TextField(
                        controller: _passwordController,
                        decoration: new InputDecoration(
                            hintText: "Enter Password",
                            icon: new Icon(Icons.lock)),
                        obscureText: true,
                      ),
                    ),
                    new Container(
                        margin: new EdgeInsets.only(left: 60.0, top: 10.0),
                        child: new Row(
                          children: <Widget>[
                            new Container(
                              child: new RaisedButton(
                                onPressed: _loginField,
                                child: new Text(
                                  "Login",
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: 18.0),
                                ),
                                color: Colors.deepOrange,
                              ),
                            ),
                            new Container(
                              margin: new EdgeInsets.only(left: 30.0),
                              child: new RaisedButton(
                                onPressed: _clearField,
                                child: new Text(
                                  "Clear",
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: 18.0),
                                ),
                                color: Colors.deepOrange,
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ),
              new Container(
                margin: new EdgeInsets.only(top: 10),
                child: new Text(
                  "Welcome! $_welcomeString",
                  style: new TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontFamily: "Monospace"),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Material(
          color: Colors.deepOrange,
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: new Icon(Icons.account_circle), title: new Text("Hey")),
              BottomNavigationBarItem(
                  icon: new Icon(Icons.print), title: new Text("Hey")),
              BottomNavigationBarItem(
                  icon: new Icon(Icons.print), title: new Text("Hey"))
            ],
          ),
        ));
  }
}
