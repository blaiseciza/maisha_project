import 'package:flutter/material.dart';
import 'package:maisha_project/pages/conseilfull.dart';
import 'package:maisha_project/pages/maladie.dart';
import 'package:maisha_project/pages/profile.dart';
//import 'package:maisha_project/pages/addconseil.dart';

class AlertComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        Divider(),
        new Row(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.all(2.0),
              child: Icon(Icons.warning),
            ),
            new Padding(
              padding: EdgeInsets.all(2.0),
              child: new MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyConseils(),
                          fullscreenDialog: true));
                },
                child: new Text("Conseil"),
              ),
            )
          ],
        ),
        Divider(),
        new Row(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.all(2.0),
              child: Icon(Icons.edit),
            ),
            new Padding(
              padding: EdgeInsets.all(2.0),
              child: new MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Maladies(),
                          fullscreenDialog: true));
                },
                child: new Text("Add Conseil"),
              ),
            )
          ],
        ),
        Divider(),
        new Row(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.all(2.0),
              child: Icon(Icons.verified_user),
            ),
            new Padding(
              padding: EdgeInsets.all(2.0),
              child: new MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Profile(),
                                fullscreenDialog: true));
                },
                child: new Text("Profile"),
              ),
            )
          ],
        ),
        Divider(),
      ],
    );
  }
}
