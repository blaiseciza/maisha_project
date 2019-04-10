import 'package:flutter/material.dart';
import 'login_page.dart';
import 'dart:async';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
      primaryColor: Color(0xFFC90000),
      primaryColorDark: Color(0xFF1E1E1E),
      primaryColorLight: Color(0xFFC90000),
      accentColor: Colors.redAccent,
      indicatorColor: Color(0xFF1E1E1E),
      cursorColor: Color(0xFFC90000),
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var n1='',n2='',n3='',n4='';
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(

      seconds: 1
    ),(){
      setState(() {
        n1='1';
      });
      
      Future.delayed(Duration(
      seconds: 1
    ),(){
      setState(() {
        n2='2';
      });
      Future.delayed(Duration(
      seconds: 1
    ),(){
      setState(() {
        n3='3';
      });
      Future.delayed(Duration(
      seconds: 1
    ),(){
      setState(() {
        n1='';n2='. . .';n3='Karibu';
        n4='. . .';
      });
      
      Future.delayed(Duration(
      seconds: 2
    ),(){
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context)=>MyAppLog(),
      ),);
    },);
    },);
    },);
    },);
      
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  body: Center(
      //    child: FlutterLogo(size: 400,),
      // ),
      body: Container(
                 width: MediaQuery.of(context).size.width,
                 height: MediaQuery.of(context).size.height/1.1,
                 decoration: BoxDecoration(
                   gradient: LinearGradient(
                     begin: Alignment.topCenter,
                     end: Alignment.bottomCenter,
                     colors: [
                       Color(0xFFC90000),
                       Color(0xFF1E1E1E)
                     ],
                   ),
                   borderRadius: BorderRadius.only(
                     bottomLeft: Radius.circular(90)
                   )
                 ),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Spacer(),
                   Align(
                     alignment: Alignment.center,
                 child:
                   Column(
                     children: <Widget>[
                       Icon(Icons.person,
                       size: 100.0,color: Colors.white,
                       ),
                       Divider(),
                       Text('$n1 $n2 $n3 $n4',style: TextStyle(color: Colors.white,fontSize: 25),),
                       Divider(),
                     ],
                   ),
                   ),
                   Spacer(),
                   Align(
                     alignment: Alignment.bottomRight,
                     child: Padding(
                       padding: const EdgeInsets.only(
                         bottom: 32.0,
                         right: 32.0),
                       child: Text('_maishAccount_',style: TextStyle(color: Colors.white,fontSize: 18.0),),
                     ))
                 ],
               ),
               ),
    );
  }
}
