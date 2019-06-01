import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:maisha_project/components/pub.dart';
import 'package:maisha_project/pages/addconseil.dart';
//import 'package:shared_preferences/shared_preferences.dart';
class Maladies extends StatefulWidget {
  _MaladiesState createState() => _MaladiesState();
}

class _MaladiesState extends State<Maladies> {
 
Future<List> _charger() async{
  final response=await http.post(PubCon.cheminPhp+"maladie.php",
  body:{
    
  }
  );
  //print(response.body);
  var datauser=json.decode(response.body);
  if(datauser.length==0){
    setState(() {
     _view=["Aucun resultat"];
    });
  }else{
    _view.clear();
    _nbre.clear();
    _detail.clear();
    _idmaladie.clear();
    //clearItems();
    setState(() {
    for(int h=0;h<datauser.length;h++){
     _view.add(datauser[h]['designation_cause'].toString());
     //addStrings(item,viewKey, listmemoview);
     _nbre.add(datauser[h]['nbre_dec'].toString()); 
     //addStrings(nbre,nbreKey, listmemonbre);
     _detail.add(datauser[h]['detail_cause'].toString()); 
     //addStrings(detail,detailKey, listmemodetail);
     _idmaladie.add(datauser[h]['id_cause'].toString());
     
     }
     
    });
    
  }
    return datauser;
}






  //fonction recherche
  var _searchView=new TextEditingController();
  bool _firstSearch=true;
  String _query="";
  List<String> _view=[""];
  List<String> _nbre=[""];
  List<String> _detail=[""];
  List<String> _idmaladie=[""];
  List<String> _filterList;
  List<String> _filterListdet=[""];
  List<String> _filterListnbre=[""];
  List<String> _filterListId=[""];
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
    _view=[""];

      _charger();
    _view.sort();
  }
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

  _MaladiesState(){
    _searchView.addListener((){
      if(_searchView.text.isEmpty){
        setState(() {
         _firstSearch=true;
         _query=""; 
        });
      }else{
        setState(() {
         _firstSearch=false;
         _query=_searchView.text; 
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    //getString();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Maladies'),
        backgroundColor: Color(0xFFC90000),
      ),
      body: new
    Column(
       children: <Widget>[
         _createSearchView(),
         _firstSearch? _createListView(): _performSearch()
       ],
    ));
  }
  //create a searchView
  Widget _createSearchView(){
    return new Container(
      decoration: BoxDecoration(border: Border.all(width: 1.0)),
      child: TextField(
        controller: _searchView,
        decoration: InputDecoration(
          icon: Icon(Icons.search,color: Colors.grey,),
          hintText: "...Recherchez Maladie...",
          hintStyle: new TextStyle(color: Colors.grey[300])
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
  //create a list Widget
  Widget _createListView(){
    return new Flexible(
      child:
       new ListView.builder(
         scrollDirection: Axis.vertical,
         shrinkWrap: true,
        itemCount:_view.length==null ? 0 : _view.length,
        itemBuilder: (BuildContext context,int index){
          //return new Text(_view[index]);
          return new Card(
            color: Colors.white,
            elevation: 5.0,
            child:Column(
              children: <Widget>[
                new ListTile(
                  //title: new Text("${_view[index]}"),
                  title: new Text("${_view[index]}"),
                  leading: new Text("${_nbre[index]} \n mort(s)"),
                  subtitle:new Text("${_detail[index]}") ,
                  onTap: (){
                    clickmaladie('${_idmaladie[index]}');
                  },
                ),
                PubCon.iconaddcons(context,'${_idmaladie[index]}'),
              ],
            ),
          );
        },
      )
      ,
    )
    ;
  }
  //perform actual search
  Widget _performSearch(){
    _filterList=new List<String>();
    _filterListdet=new List<String>();
    _filterListnbre=new List<String>();
    for(int i=0;i<_view.length;i++){
      var id=_idmaladie[i];
      var item=_view[i];
      var itemdet=_detail[i];
      var itemnbre=_nbre[i];
      if(item.toLowerCase().contains(_query.toLowerCase())){
        _filterListId.add(id);
        _filterList.add(item);
        _filterListdet.add(itemdet);
        _filterListnbre.add(itemnbre);
      }
    }
    return _createFilteredListView();
  }
  //
  void clickmaladie(String idmaladie){
    if(PubCon.userPrivilege=='Doct'){
      var route = new MaterialPageRoute(
          builder: (BuildContext context) =>
              new AddConseils(idmaladie: idmaladie),
        );

        Navigator.of(context).push(route);
    }
  }
  //create the filtered listview
  Widget _createFilteredListView(){
    return new Flexible(
      child: new ListView.builder(
        //itemCount: _filterList.length,
        itemCount:_filterList.length==null ? 0 : _filterList.length,
        itemBuilder: (BuildContext context,int index){
          return new Card(
            color: Colors.white,
            elevation: 5.0,
            child: new Container(
              margin: EdgeInsets.all(15.0),
              child:new ListTile(
              title: new Text("${_filterList[index]}"),
              leading: new Text("${_filterListnbre[index]} \n mort(s)"),
              subtitle:new Text("${_filterListdet[index]}") ,
              onTap: (){
                clickmaladie("${_filterListId[index]}");
              },
            ),
            ),
          );
        },
      ),
    );
  }
}