import 'package:flutter/material.dart';
import 'package:maisha_project/components/pub.dart';
import 'package:maisha_project/pages/commentaires.dart';
import 'package:maisha_project/pages/conseilfull.dart';


class SecondScreen extends StatefulWidget {
  final ConseilsFull value;
  SecondScreen({Key key, this.value}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  




  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('Details',style: TextStyle(color: Color(0xFFC90000),fontWeight: FontWeight.bold,)),
        backgroundColor: Colors.white12,
      ),
      //bottom navigation
      
      bottomNavigationBar: new Container(
        color: Colors.white12,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: ListTile(
              title: Text("${widget.value.nbrecom}",textAlign: TextAlign.center,),
            subtitle: Text('personnes ont reagit'),
            )),
            Expanded(
              child: ListTile(
               title: Icon(Icons.mode_comment),
               subtitle: Text("Commentaires"),
                   onTap: (){
                     PubCon.conseilID='${widget.value.id}';
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Commentaires(),
                            ));
                   },
                  
              ),
            ),
          ],
        ),
      ),







      body: new 
      //Container(
      //   //elevation: 5.0,
      //   child: new Container(
      //     decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
      //     padding: EdgeInsets.all(8.0),
      //     margin: EdgeInsets.all(8.0),
          //child: 
          ListView(
            padding: EdgeInsets.all(8.0),
            children: <Widget>[
              // Card(
              //   elevation: 5.0,
              //   color: Colors.white,
              //   child: Padding(
              //     child: new Text(
              //       '${widget.value.designationcause.toUpperCase()}',
              //       style: new TextStyle(
              //           fontWeight: FontWeight.bold, fontSize: 20.0),
              //       textAlign: TextAlign.center,
              //     ),
              //     padding: EdgeInsets.only(bottom: 8.0),
              //   ),
              // ),
              Card(
                elevation: 3.0,
                color: Colors.white,
                child: Padding(
                  
                  child: 
                  Image.network('${widget.value.photocons}'),
                  padding: EdgeInsets.all(12.0),
                ),
              ),
              Divider(),
              Card(
                elevation: 3.0,
                color: Colors.white,
                child: Column(
                  children: <Widget>[   
              Row(
                children: <Widget>[
                  Padding(
                    child: Text(
                      '${widget.value.datecons}',
                      style: new TextStyle(fontStyle: FontStyle.normal),
                      textAlign: TextAlign.right,
                    ),
                    padding: EdgeInsets.all(3.0),
                  ),
                  Text(" | "),
                  Padding(
                    child: Text(
                      'dr. ${widget.value.username}',
                      style: new TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.right,
                    ),
                    padding: EdgeInsets.all(3.0),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.dehaze,color: Colors.red,),
                  Padding(
                    child: Text('Maladie: ${widget.value.designationcause.toUpperCase()}',
                        style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.red),
                        textAlign: TextAlign.left),
                    padding: EdgeInsets.all(3.0),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text('${widget.value.apropos}',textAlign: TextAlign.justify,),
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.warning,color: Colors.red,),
                  Padding(
                    child: 
                    Text("Mode de Prevention :",
                        style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.red),
                        textAlign: TextAlign.left,),
                    padding: EdgeInsets.all(3.0),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text('${widget.value.prevention}',textAlign: TextAlign.justify,),
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.healing,color: Colors.red,),
                  Padding(
                    child: Text('Traitement :',
                        style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.red),
                        textAlign: TextAlign.left),
                    padding: EdgeInsets.all(3.0),
                  ),
                ],
              ),
              Text('${widget.value.traitement}',textAlign: TextAlign.justify,),
              Row(
                children: <Widget>[
                  Padding(
                    child: new Text('\n ${widget.value.nbrecom}'+" commentaires",
                        style: new TextStyle(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.left
                        ),
                    padding: EdgeInsets.all(3.0),
                  ),
                ],
              ),
               ],),), 
               
               Divider()
               
            ],
          ),
        //),
      //),
    );
  }
}
