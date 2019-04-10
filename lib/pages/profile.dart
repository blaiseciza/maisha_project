import 'package:flutter/material.dart';
import 'package:maisha_project/components/pub.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController user= new TextEditingController(),
      sexe = new TextEditingController(),
      date = new TextEditingController(),
      privilege = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    user.text=PubCon.userName;
    sexe.text=PubCon.userSexe;
    date.text=PubCon.userDate;
    privilege.text=PubCon.userPrivilege;
        return Scaffold(
      appBar: AppBar(centerTitle: true,
        title:new Text("Profile",style: TextStyle(color: Color(0xFFC90000),fontWeight: FontWeight.bold,)),
        backgroundColor: Colors.white12,),
    body:ListView(
      children: <Widget>[
        
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: <Widget>[
                Container(
                  height: 150,
                  width: 150,
                  child: CircleAvatar(
                    radius: 40,
                              backgroundImage: new NetworkImage(PubCon.userImage == ''
                                  ? PubCon.cheminPhotoDefault
                                  : PubCon.cheminPhotoAvatar + PubCon.userImage),
                              child: new FlatButton(
                                onPressed: () {
                                },
                                child: null,
                              ),
                              
                            ),
                ),
              ],
            ),
          
                  Padding(padding: EdgeInsets.all(4.0),),
                  Padding(padding: EdgeInsets.all(2.0),
                  child: TextField(
                     controller: user,
                     enabled: false,
                     decoration: InputDecoration(
                       icon: Icon(Icons.verified_user,color: Colors.grey,),
                       hintText: 'Nom',
                       labelText: 'Nom'
                //         border: new OutlineInputBorder(
                //      borderRadius: new BorderRadius.circular(20.0)
                //  ),
                     ),
                    
                 ),
                  ),
                  Padding(padding: EdgeInsets.all(2.0),
                  child: TextField(
                     controller: sexe,
                     enabled: false,
                     decoration: InputDecoration(
                       icon: Icon(Icons.text_rotation_down,color: Colors.grey,),
                       hintText: 'sexe',
                       labelText: 'sexe'
                //         border: new OutlineInputBorder(
                //      borderRadius: new BorderRadius.circular(20.0)
                //  ),
                     ),
                    
                 ),
                  ),
                  Padding(padding: EdgeInsets.all(2.0),
                  child: TextField(
                     controller: date,
                     enabled: false,
                     decoration: InputDecoration(
                       icon: Icon(Icons.date_range,color: Colors.grey,),
                       hintText: 'Date de Naissance',
                       labelText: 'Date de Naissance'
                //         border: new OutlineInputBorder(
                //      borderRadius: new BorderRadius.circular(20.0)
                //  ),
                     ),
                    
                 ),
                  ),
                  Padding(padding: EdgeInsets.all(2.0),
                  child: TextField(
                     controller: privilege,
                     enabled: false,
                     decoration: InputDecoration(
                       icon: Icon(Icons.text_fields,color: Colors.grey,),
                       hintText: 'Privilege',
                       labelText: 'Privilege'
                //         border: new OutlineInputBorder(
                //      borderRadius: new BorderRadius.circular(20.0)
                //  ),
                     ),
                    
                 ),
                  ),

      ],
    )
    
    );
    
  }
}