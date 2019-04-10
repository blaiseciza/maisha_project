import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:maisha_project/components/pub.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class Commentaires extends StatefulWidget {
  @override
  _CommentairesState createState() => _CommentairesState();
}

class _CommentairesState extends State<Commentaires> {
  TextEditingController cComment = new TextEditingController();
  Future addComment() async {
    var uri = Uri.parse(PubCon.cheminPhp + "addcomment.php");
    var request = new http.MultipartRequest("POST", uri);
    request.fields['id_user_com'] = PubCon.userId;
    request.fields['id_cons_com'] = PubCon.conseilID;
    request.fields['text_com'] = cComment.text;
    var response = await request.send();
    if (response.statusCode == 200) {
      print("Enregistrement reussi");
      cComment.clear();
      _charger();
    } else {
      print("Echec d'enregistrement");
    }
  }

  @override
  void initState() {
    super.initState();
    // _myPreferences.init().then((value){
    //   setState((){
    //     _myPreferences=value;

    //   });
    //   });
// listmemoview=[];
// listgetmemoview=[""];
// listmemonbre=[];
// listgetmemonbre=[""];
// listmemodetail=[];
// listgetmemodetail=[""];
    // _view=new List<String>();
    //_view=[""];

    _charger();
    //_view.sort();
  }

//connection to json// chargement des donnees
  //String _query = "";
  List<String> _username = [""];
  List<String> _date = [""];
  List<String> _detail = [""];
  List<String> _photo = [""];
  Future<List> _charger() async {
    final response =
        await http.post(PubCon.cheminPhp + "chargercomment.php", body: {
      "id_cons_com": PubCon.conseilID,
    });
    //print(response.body);
    var datauser = json.decode(response.body);
    if (datauser.length == 0) {
      setState(() {
        _username = ["Aucun Commentaire"];
      });
    } else {
      _username.clear();
      _date.clear();
      _detail.clear();
      _photo.clear();
      //clearItems();
      setState(() {
        for (int h = 0; h < datauser.length; h++) {
          var photo = datauser[h]['photouser'].toString();
          var item = datauser[h]['username'].toString();
          var date = datauser[h]['date_com'].toString();
          var detail = datauser[h]['text_com'].toString();
          _username.add(item);
          //addStrings(item,viewKey, listmemoview);
          _date.add(date);
          //addStrings(nbre,nbreKey, listmemonbre);
          _detail.add(detail);
          //addStrings(detail,detailKey, listmemodetail);
          _photo.add(photo);
          //addStrings(detail,detailKey, listmemodetail);
        }
      });
    }
    return datauser;
  }

//create a list Widget
  Widget _createListView() {
    return new Flexible(
      child: new ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _username.length == null ? 0 : _username.length,
        itemBuilder: (BuildContext context, int index) {
          //return new Text(_view[index]);
          return new Column(
            //color: Colors.white12,
            children: <Widget>[
              Divider(),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: new NetworkImage(
                              _photo[index] == null
                                  ? PubCon.cheminPhotoDefault
                                  : PubCon.cheminPhotoAvatar+'${_photo[index]}'),
                          child: new FlatButton(
                            onPressed: () {     
                            },
                            child: null,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 5,
                      child: ListTile(
                        title: Text('${_username[index]}'),
                        subtitle:
                            Text('${_detail[index]} \n\n ${_date[index]}'),
                      )),
                ],
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Text('Commentaires',
            style: TextStyle(
              color: Color(0xFFC90000),
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.white12,
      ),

      //body here
      body: Column(
        children: <Widget>[
          Divider(),
          Container(
            color: Colors.white12,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: new NetworkImage(PubCon.userImage == ''
                            ? PubCon.cheminPhotoDefault
                            : PubCon.cheminPhotoAvatar + PubCon.userImage),
                        child: new FlatButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Maladies(),
                            //         fullscreenDialog: true));
                          },
                          child: null,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: TextField(
                    focusNode: FocusNode(),
                    maxLines: 2,
                    controller: cComment,
                    decoration: new InputDecoration(
                        hintText: "Exprimez-vous ici",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0))),
                  ),
                ),
                Expanded(
                  child: new IconButton(
                    tooltip: 'Envoyer',
                    icon: Icon(
                      Icons.send,
                      color: Color(0xFFC90000),
                    ),
                    onPressed: () {
                      addComment();
                    },
                  ),
                )
              ],
            ),
          ),
          Divider(),
//Chargement des commentaires ici
          _createListView(),
        ],
      ),
    );
  }
}
