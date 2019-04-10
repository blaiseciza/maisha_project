import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:maisha_project/admin_page.dart';
import 'package:maisha_project/pages/home.dart';
import 'package:maisha_project/member_page.dart';
import 'package:maisha_project/components/pub.dart';
import 'package:maisha_project/regi_page.dart';

void main()=>runApp(new MyAppLog());
String username='';
class MyAppLog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return new MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Login Here',
      home: new MyHomePage(),
      routes: <String,WidgetBuilder>{
        '/admin_page':(BuildContext context)=>new AdminPage(username: username),
        '/member_page':(BuildContext context)=>new MemberPage(username: username),
        '/login_page':(BuildContext context)=>new MyHomePage(),
      },
    );
  }
}
class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController user=new TextEditingController();
  TextEditingController pass=new TextEditingController();
  String msg='';
Future<List> _login() async{
  final response=await http.post(PubCon.cheminPhp+"login.php",
  body:{
    "username":user.text,
    "motpasse":pass.text
  }
  );
  //print(response.body);
  var datauser=json.decode(response.body);
  if(datauser.length==0){
    PubCon.showDialogcz(context ,"Desole\n", "Echec de connexion");
    setState(() {
     msg="Login Fail" ;
    });
  }else{
    // if(datauser[0]['privilegeuser']=='Adm'){
    //   Navigator.pushReplacementNamed(context, '/admin_page');
    // }else if(datauser[0]['privilegeuser']=='SA'){
    //   Navigator.pushReplacementNamed(context, '/member_page');
    // }
    PubCon.showDialogcz(context, "Confirmation\n", "Connexion reussie");
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),fullscreenDialog: true));
    setState(() {
     username=datauser[0]['username']; 
     PubCon.userId=datauser[0]['id'];
     PubCon.userName=datauser[0]['username'];
     PubCon.userPrivilege=datauser[0]['privilegeuser'];
     PubCon.userSexe=datauser[0]['sexeuser'];
     PubCon.userDate=datauser[0]['date_naiss_user'];
     PubCon.userImage=datauser[0]['photouser'];
    });
  }
    return datauser;
}
@override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: 
       //Container(
         //============
           //child: 
           ListView(
             children: <Widget>[
               Container(
                 width: MediaQuery.of(context).size.width,
                 height: MediaQuery.of(context).size.height/2.5,
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
                     bottomLeft: Radius.circular(40),
                     bottomRight: Radius.circular(40)
                   )
                 ),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Spacer(),
                   Text("_MaishAccount_",style: TextStyle(fontSize: 20.0,color: Colors.white),),
                   Spacer(),
                   Align(
                     alignment: Alignment.center,
                 child:
                 
                   Icon(Icons.person,
                   size: 90.0,color: Colors.white,
                   ),
                   ),
                   //Spacer(),
                   Align(
                     alignment: Alignment.bottomRight,
                     child: Padding(
                       padding: const EdgeInsets.only(
                         //bottom: ,
                         right: 32.0),
                       //child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 18.0),),
                     ))
                 ],
               ),
               ),
               Container(
                 height:MediaQuery.of(context).size.height/1.5,
                 width: MediaQuery.of(context).size.width,
                 padding: EdgeInsets.only(top: 60.0),
                 child: ListView(
                   children: <Widget>[
                //      Container(
                //  width: MediaQuery.of(context).size.width/1.2,
                //  height: 45,
                //  padding: EdgeInsets.only(
                //    top: 4,left: 16,right: 16,bottom: 4
                //  ),
                //  decoration: BoxDecoration(
                //    borderRadius: BorderRadius.all(
                //      Radius.circular(50)
                //    ),
                //    color: Colors.white,
                //    boxShadow: [BoxShadow(
                //      color: Colors.black12,
                //       blurRadius: 5.0
                //    )]
                //  ),
                 //child:
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: TextField(
                     controller: user,
                     decoration: InputDecoration(
                       icon: Icon(Icons.text_fields,color: Colors.grey,),
                       hintText: 'Nom d\'utilisateur',
                //         border: new OutlineInputBorder(
                //      borderRadius: new BorderRadius.circular(20.0)
                //  ),
                     ),
                    
                 ),
                  ),
               //),
                     Padding(
                       padding: const EdgeInsets.all(2.0),
                       child: TextField(
                   controller: pass,
                   obscureText: true,
                   decoration: InputDecoration(
                       icon: Icon(Icons.vpn_key,color: Colors.grey,),
                       hintText: 'Mot de Passe',
                      //   border: new OutlineInputBorder(
                      //  borderRadius: new BorderRadius.circular(20.0)
                 //),
                   ),
                 ),
                     ),
               
               Align(
                 alignment: Alignment.centerRight,
                 child: Padding(
                   padding: const EdgeInsets.only(
                     top: 16,right: 32, bottom: 32
                   ),
                   child:new FlatButton(
                     onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => MyRegiPage()));
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),fullscreenDialog: true));
                     },
                     child: Text('Pas de compte? créer ici',style: TextStyle(
                       color: Colors.grey,fontWeight: FontWeight.bold,
                     ),),
                   ),
                   
                 ),
                 ),
                 //Spacer(),
                 Container(
                   height: 55,
                   width: MediaQuery.of(context).size.width/1.3,
                   decoration: BoxDecoration(
                     gradient:  LinearGradient(
                       colors: [
                       Color(0xFFC90000),
                       Color(0xFF1E1E1E)
                       ]
                     ),
                     borderRadius: BorderRadius.all(
                       Radius.circular(20)
                     )
                   ),
                  child: Center(child:new FlatButton (
                    onPressed: (){_login();},
                    child: Text('Login'.toUpperCase(),
                    style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold),),
                    
                  ),
                  ),
                 ),
                 Container(
                   padding: EdgeInsets.all(20.0),
                 )
                  
                   ],
                 ),
               )
               ],
           ),
       
       //),
    );
  }
}