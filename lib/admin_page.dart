import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  AdminPage({this.username});
  final String username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome Admin $username"),),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('LogOut'),
            onPressed: (){
              Navigator.pushReplacementNamed(context, '/login_page');
          },)
        ],
      ),
    );
  }
}