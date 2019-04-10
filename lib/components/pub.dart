import 'package:flutter/material.dart';
import 'package:maisha_project/pages/addconseil.dart';
//import 'package:shared_preferences/shared_preferences.dart';
class PubCon{
static const ip='192.168.43.156';
static const cheminPhp="http://$ip/maishaCount/connMobile/";
static const cheminPhotoConseils="http://$ip/maishaCount/avatar/conseils/";
static const cheminPhotoAvatar="http://$ip/maishaCount/avatar/";
static const cheminPhotoDefault="http://$ip/maishaCount/avatar/567fa16c31ccb.jpg";
static var userId='';
static var userName='';
static var userSexe='';
static var userDate='';
static var userPrivilege='';
static var userImage='';
static var conseilID='';
static var maladieID='';
static var addconseil='';
static void showDialogcz(BuildContext ctx,String menu,String msg){
  showDialog(
                        context: ctx,
                        builder: (context) => new AlertDialog(
                              title: new Text(""+menu+"\n+"+msg),
                              content: new Container(
                                height: 50.0,
                                child: IconButton(
                                  icon:Icon(Icons.cancel), 
                                onPressed: () {
                                  Navigator.pop(context);
                                },

                                )
                              ),
                            )
                            );
}
static Widget iconaddcons(BuildContext context,String idmaladie){
  if(userPrivilege=='Doct'){
    return new IconButton(
                    tooltip: 'Ajouter conseil',
                    icon: Icon(
                      Icons.add_alert,
                      color: Color(0xFFC90000),
                    ),
                    onPressed: () {
                      var route = new MaterialPageRoute(
          builder: (BuildContext context) =>
              new AddConseils(idmaladie: idmaladie),

        );
        Navigator.of(context).push(route);
                    },
                  );
  }else{
    return new Text('');
  }
}
//Shared preferences===================================================

//Future<SharedPreferences> _sPrefs=SharedPreferences.getInstance();
  // List<String> listmemoview;
  // List<String> listgetmemoview;
  // List<String> listmemonbre;
  // List<String> listgetmemonbre;
  // List<String> listmemodetail;
  // List<String> listgetmemodetail;
  // String viewKey="listview";
  // String nbreKey="listnbre";
  // String detailKey="listdetail";
  //data memory
  //MyPreferences _myPreferences;




// Future<Null> addStrings(String data,String key,List<String> value) async{
  //   final SharedPreferences prefs=await _sPrefs;
  //   value.add(data);
  //   prefs.setStringList(key, value);

  // }
  // Future<Null> clearItems() async{
  //   final SharedPreferences prefs=await _sPrefs;
  //   prefs.clear();
  //   setState(() {
  //    listmemoview=[]; 
  //    listmemonbre=[];
  //    listmemodetail=[];
  //   });

  // }
  // Future<Null> getString() async{
  //   final SharedPreferences prefs=await _sPrefs;
  //   if(prefs.getStringList(viewKey) !=null){
  //   listgetmemoview=prefs.getStringList(viewKey);
  //   listgetmemonbre=prefs.getStringList(nbreKey);
  //   listgetmemodetail=prefs.getStringList(detailKey);
  //   setState(() {
  //   });
  //   }
  // }
}