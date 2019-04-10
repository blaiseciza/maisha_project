import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'package:maisha_project/pages/detailconseil.dart';
import 'package:maisha_project/components/pub.dart';

class MyConseils extends StatefulWidget {
  _ConseilsState createState() => _ConseilsState();
}

class _ConseilsState extends State<MyConseils> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title:new Text("Conseils",style: TextStyle(color: Color(0xFFC90000),fontWeight: FontWeight.bold,)),
        backgroundColor: Colors.white12,
      ),
      body: new Container(
          child: new FutureBuilder<List<ConseilsFull>>(
              future: downloadJSON(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ConseilsFull> conseilsFull = snapshot.data;

                  return CustomListView(conseilsFull);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                return new CircularProgressIndicator();
              })),
    );
  }
}

class ConseilsFull {
  final String id;
  final String username,
      designationcause,
      apropos,
      prevention,
      traitement,
      datecons,
      nbrecom,
      photocons;

  ConseilsFull({
    Key key,
    this.id,
    this.username,
    this.designationcause,
    this.apropos,
    this.prevention,
    this.traitement,
    this.datecons,
    this.nbrecom,
    this.photocons,
  });
  factory ConseilsFull.fromJson(Map<String, dynamic> jsonData) {
    return ConseilsFull(
        id: jsonData['id_cons'],
        username: jsonData['username'],
        designationcause: jsonData['designation_cause'],
        apropos: jsonData['apropos_cons'],
        prevention: jsonData['prevention_cons'],
        traitement: jsonData['traitement_cons'],
        datecons: jsonData['date_cons'],
        nbrecom: jsonData['nbre_com'],
        photocons: PubCon.cheminPhotoConseils + jsonData['photo_cons']);
  }
}

class CustomListView extends StatelessWidget {
  final List<ConseilsFull> conseilFull;
  CustomListView(this.conseilFull);
  Widget build(context) {
    return ListView.builder(
        itemCount: conseilFull.length,
        itemBuilder: (context, int currentIndex) {
          return createViewItem(conseilFull[currentIndex], context);
        });
  }
  //}

  Widget createViewItem(ConseilsFull conseilFull, BuildContext context) {
    return new ListTile(
      title: new Card(
        elevation: 3.0,
        child: new Container(
          decoration:
              BoxDecoration(border: Border.all(color: Colors.white)),
          padding: EdgeInsets.all(2.0),
          margin: EdgeInsets.all(1.0),
          child: Column(
            children: <Widget>[
              Padding(
                child: Image.network(conseilFull.photocons),
                padding: EdgeInsets.only(bottom: 4.0),
              ),
              Row(
                children: <Widget>[
                  Divider(),
                  Padding(
                    child: Text(
                      conseilFull.datecons,
                      style: new TextStyle(fontStyle: FontStyle.normal),
                      textAlign: TextAlign.right,
                    ),
                    padding: EdgeInsets.all(1.0),
                  ),
                  Text(" | "),
                  Padding(
                    child: Text("Dr."+
                      conseilFull.username,
                      style: new TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.right,
                    ),
                    padding: EdgeInsets.all(1.0),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    child: Text(conseilFull.designationcause,
                        style: new TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left),
                    padding: EdgeInsets.all(1.0),
                  ),
                ],
              ),
              Text(conseilFull.apropos),
              Row(
                children: <Widget>[
                  Padding(
                    child: new Text(conseilFull.nbrecom + " commentaires",
                        style: new TextStyle(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.right),
                    padding: EdgeInsets.all(1.0),
                  ),
                  Divider(),
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        //create a new page
        //
        var route = new MaterialPageRoute(
          builder: (BuildContext context) =>
              new SecondScreen(value: conseilFull),
        );

        Navigator.of(context).push(route);
      },
    );
  }
}

Future<List<ConseilsFull>> downloadJSON() async {
  final jsonEndpoint = PubCon.cheminPhp + "conseil.php";
  final response = await get(jsonEndpoint);
  //var data = json.decode(response.body);
  if (response.statusCode == 200) {
    //if(data.length != 0){
    List conseilsFull = json.decode(response.body);
    return conseilsFull
        .map((conseilsFull) => new ConseilsFull.fromJson(conseilsFull))
        .toList();
  } else {
    throw Exception('Nous n\'avons pas pu telecharger toutes les donnees.');
  }
}
