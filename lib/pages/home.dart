import 'package:flutter/material.dart';
//my own imports'
// import 'package:maisha_project/pages/dashboard.dart';
// import 'package:maisha_project/pages/maladie.dart';
// import 'package:maisha_project/pages/conseil.dart';
import 'package:maisha_project/components/component_alert.dart';
import 'package:maisha_project/components/pub.dart';
import 'package:maisha_project/login_page.dart';
import 'package:maisha_project/pages/conseilfull.dart';
//import 'package:maisha_project/pages/conseilfull.dart';
import 'package:maisha_project/pages/dashboard.dart';
import 'package:maisha_project/pages/maladie.dart';
import 'package:maisha_project/pages/profile.dart';
//import 'package:maisha_project/pages/maladie.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  // int _currentIndex=0;
  // List<Widget> _tabList=[
  //   Container(child: Dashboard(),),
  //   Container(child: Maladies(),),
  //   //Container(child: MyConseils(),)
  // ];
  // TabController _tabController;
  // @override
  // void initState() {
  //   super.initState();
  //   _tabController=TabController(
  //     vsync: this,length: _tabList.length
  //   );
  // }
  // @override
  // void dispose() {
  //   _tabController.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    //this code is going to give us the width of the screen
    //final mediaQuerydata=MediaQuery.of(context);
    //final size=mediaQuerydata.size.width;

    return Scaffold(
      appBar: AppBar(
        //centerTitle: true,
        title: new Text(
          'MaisAccount',
          style: TextStyle(
            color: Color(0xFFC90000),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white12,
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.exit_to_app, color: Color(0xFFC90000)),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyAppLog(),
                  ));
            },
          ),
          new IconButton(
              icon: Icon(Icons.menu, color: Color(0xFFC90000)),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => new AlertDialog(
                          title: new Text("Menu",
                              style: TextStyle(
                                color: Color(0xFFC90000),
                              )),
                          content: new Container(
                              height: 120.0, child: AlertComponents()),
                        ));
              })
        ],
      ),
      bottomNavigationBar: new Container(
        color: Colors.white12,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white12,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: new NetworkImage(PubCon.userImage == ''
                        ? PubCon.cheminPhotoDefault
                        : PubCon.cheminPhotoAvatar + PubCon.userImage),
                    child: new FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Profile(),
                                fullscreenDialog: true));
                      },
                      child: null,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: new IconButton(
                tooltip: 'Maladies',
                icon: Icon(
                  Icons.local_hospital,
                  color: Color(0xFFC90000),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Maladies(),
                          fullscreenDialog: true));
                },
              ),
            ),
            Expanded(
              child: new IconButton(
                tooltip: 'Conseils',
                icon: Icon(
                  Icons.add_alert,
                  color: Color(0xFFC90000),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyConseils(),
                          fullscreenDialog: true));
                },
              ),
            )
          ],
        ),
      ),
      body: Container(
        child: Dashboard(),
      ),
    );
  }
}
