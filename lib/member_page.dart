import 'package:flutter/material.dart';

class MemberPage extends StatelessWidget {
  MemberPage({this.username});
  final String username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome user $username"),),
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