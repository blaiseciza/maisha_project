import 'package:flutter/material.dart';
//import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:intl/intl.dart';
import 'package:maisha_project/components/pub.dart';

class Dashboard extends StatefulWidget {
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //test contenu champs
//fonction de chargement pour le chart evoulution mort pour chaque maladie
  List<String> _view = [""];
  List<String> _nbre = [""];
  var dataevolution = [
    Sales("", 1, Colors.red),
  ];
  var nbreNaiss = 0;
  var nbreNaissmin = 0;
  var nbreDeces = 0;
  var nbreDecesmin = 0;
  Future<List> _chargerDecesMin() async {
    final response = await http.post(
        PubCon.cheminPhp + "chargementdecesmin.php",
        body: {"date1": date1.toString(), "date2": date2.toString()});
    var datauser = json.decode(response.body);
    if (datauser.length == 0) {
      setState(() {});
    } else {
      setState(() {
        for (int h = 0; h < datauser.length; h++) {
          var nbre = datauser[h]['nbre_tot'].toString();
          nbreDecesmin = nbre == null || nbre.isEmpty ? 0 : int.parse(nbre);
        }
      });
    }
    return datauser;
  }

  Future<List> _chargerDeces() async {
    final response = await http.post(PubCon.cheminPhp + "chargementdeces.php",
        body: {"date1": date1.toString(), "date2": date2.toString()});
    var datauser = json.decode(response.body);
    if (datauser.length == 0) {
      setState(() {});
    } else {
      setState(() {
        for (int h = 0; h < datauser.length; h++) {
          var nbre = datauser[h]['nbre_tot'].toString();
          nbreDeces = nbre == null || nbre.isEmpty ? 0 : int.parse(nbre);
        }
      });
    }
    return datauser;
  }

  Future<List> _chargerNaissMin() async {
    final response = await http.post(
        PubCon.cheminPhp + "chargementnaissmin.php",
        body: {"date1": date1.toString(), "date2": date2.toString()});
    var datauser = json.decode(response.body);
    if (datauser.length == 0) {
      setState(() {});
    } else {
      setState(() {
        for (int h = 0; h < datauser.length; h++) {
          var nbre = datauser[h]['nbre_tot'].toString();
          nbreNaissmin = nbre == null || nbre.isEmpty ? 0 : int.parse(nbre);
        }
      });
    }
    return datauser;
  }

  Future<List> _chargerNaiss() async {
    final response = await http.post(PubCon.cheminPhp + "chargementnaiss.php",
        body: {"date1": date1.toString(), "date2": date2.toString()});
    var datauser = json.decode(response.body);
    if (datauser.length == 0) {
      setState(() {});
    } else {
      setState(() {
        for (int h = 0; h < datauser.length; h++) {
          var nbre = datauser[h]['nbre_tot'].toString();
          nbreNaiss = nbre == null || nbre.isEmpty ? 0 : int.parse(nbre);
        }
      });
    }
    return datauser;
  }

  Future<List> _chargerEvolution() async {
    final response =
        await http.post(PubCon.cheminPhp + "maladie.php", body: {});
    //print(response.body);
    var datauser = json.decode(response.body);
    if (datauser.length == 0) {
      setState(() {
        _view = ["Aucun resultat"];
      });
    } else {
      //_view.clear();
      _nbre.clear();
      dataevolution.clear();
      //_detail.clear();
      //clearItems();
      setState(() {
        for (int h = 0; h < datauser.length; h++) {
          var item = datauser[h]['designation_cause'].toString();
          var nbre = datauser[h]['nbre_dec'].toString();
          _view.add(item);
          _nbre.add(nbre);
          //ajout des donnees pour notre chart
          dataevolution.add(Sales(item,
              nbre == null || nbre == '' ? 0 : int.parse(nbre), Colors.red));
        }
      });
    }
    return datauser;
  }

  final List<String> _items1 = ['GOMA'].toList();
  //final List<String> _items2 = ['1', '2','3','4','5','6','7','8','9','10','11','12'].toList();
  String _selection1;
  TextEditingController cdate1 = new TextEditingController();
  TextEditingController cdate2 = new TextEditingController();
  DateTime date1, date2;
  @override
  void initState() {
    _selection1 = _items1.first;
    cdate1.text = '1900-01-01';
    date1=DateTime.parse('1900-01-01');
    cdate2.text = '2099-01-01';
    date2=DateTime.parse('2099-01-01');
    if (cdate1.text != null && cdate2.text != null) {
      _chargerNaiss();
      _chargerDeces();
      _chargerNaissMin();
      _chargerDecesMin();
      _chargerEvolution();
    }
    super.initState();
  }
Future<Null> _selectDate1(BuildContext context) async{
  final DateTime picked = await
  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2099),

                  );
                  setState(() {
                   date1 =picked;
                  });
}
Future<Null> _selectDate2(BuildContext context) async{
  final DateTime picked = await
  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2099),

                  );
                  setState(() {
                   date2 =picked;
                  });
}
  @override
  Widget build(BuildContext context) {
//dropdown
    final dropdownMenuOptions1 = _items1
        .map((String item) =>
            new DropdownMenuItem<String>(value: item, child: new Text(item)))
        .toList();
//====================================================================

    var datapop = [
      Sales("Naiss\n", nbreNaiss, Colors.pink),
      Sales("Décès\n", nbreDeces, Colors.red),
    ];
    var datamineur = [
      Sales("Mère\n-18", nbreNaissmin, Colors.pink),
      Sales("Décès\n-18", nbreDecesmin, Colors.red),
    ];
    // var data3=[
    //   Sales("Malaria",50,Colors.red),
    //   Sales("Sida",100,Colors.pink),
    //   Sales("Tiffoid",25,Colors.redAccent),
    //   Sales("Tension",30,Colors.pinkAccent),
    //   Sales("Diabet",60,Colors.redAccent),
    // ];
    var data3 = dataevolution;
    //drag graphics
    var seriesmineur = [
      charts.Series(
          domainFn: (Sales sales, _) => sales.maladie,
          measureFn: (Sales sales, _) => sales.sold,
          colorFn: (Sales sales, _) => sales.color,
          id: "Sales",
          data: datamineur,
          labelAccessorFn: (Sales sales, _) =>
              '${sales.maladie} : ${sales.sold.toString()}')
    ];
    var seriespop = [
      charts.Series(
          domainFn: (Sales sales, _) => sales.maladie,
          measureFn: (Sales sales, _) => sales.sold,
          colorFn: (Sales sales, _) => sales.color,
          id: "Sales",
          data: datapop,
          labelAccessorFn: (Sales sales, _) =>
              '${sales.maladie} : ${sales.sold.toString()}')
    ];
    var series3 = [
      charts.Series(
          domainFn: (Sales sales, _) => sales.maladie,
          measureFn: (Sales sales, _) => sales.sold,
          colorFn: (Sales sales, _) => sales.color,
          id: "Sales",
          data: data3,
          labelAccessorFn: (Sales sales, _) =>
              '${sales.maladie} : ${sales.sold.toString()}')
    ];
    var chartmineur = charts.PieChart(
      seriesmineur,
      defaultRenderer: charts.ArcRendererConfig(
          arcRendererDecorators: [charts.ArcLabelDecorator()]),
    );
    var chartpop = charts.PieChart(
      seriespop,
      defaultRenderer: charts.ArcRendererConfig(
          arcRendererDecorators: [charts.ArcLabelDecorator()]),
    );
    var chart3 = charts.BarChart(
      series3,
      vertical: false,
      barRendererDecorator: charts.BarLabelDecorator<String>(),
      domainAxis: charts.OrdinalAxisSpec(renderSpec: charts.NoneRenderSpec()),
    );

    //==========================================================================================
    return new ListView(children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: 45,
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5.0)]),
        child: new DropdownButtonFormField(
          value: _selection1,
          items: dropdownMenuOptions1,
          onChanged: (s) {
            setState(() {
              _selection1 = s;
            });
          },
          decoration: InputDecoration(
            icon: Icon(
              Icons.place,
              color: Colors.grey,
            ),
            hintText: '       ---Selectionnez le Lieu---',
          ),
        ),
      ),
      Divider(),
      Column(
                children: <Widget>[
                  Icon(Icons.warning,color: Colors.red,),
                  Padding(
                    child: Text('Attention au mauvais trie,\n vous n\'aurez pas de resultat!!\n',
                        style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.red),
                        textAlign: TextAlign.left),
                    padding: EdgeInsets.all(1.0),
                  ),
                ],
              ),
              Divider(),
              Divider(),
      // Padding(
      //   padding: const EdgeInsets.all(2.0),
      //   child: DateTimePickerFormField(
      //     inputType: InputType.date,
      //     format: DateFormat('yyyy-MM-dd'),
      //     editable: false,
      //     controller: cdate1,
      //     decoration: InputDecoration(
      //       labelText: 'Du... ',
      //       hasFloatingPlaceholder: false,
      //       icon: Icon(
      //         Icons.date_range,
      //         color: Colors.grey,
      //       ),
      //       //       border: new OutlineInputBorder(
      //       //  borderRadius: new BorderRadius.circular(20.0)),
      //     ),
      //     onChanged: (dt) => setState(() => date1 = dt),
      //   ),
      // ),
      Padding(
                     padding: const EdgeInsets.all(2.0),
                     child: TextField(
                       maxLines: 2,
                     controller: cdate1,
                     decoration: InputDecoration(
                       icon: Icon(Icons.date_range,color: Colors.grey,),
                       hintText: 'Du:\n'+date1.toString(),
                       
                     ),
                     onTap:(){_selectDate1(context);
                     cdate1.text='';
                     
                     },
                     
                     )),
      // Padding(
      //   padding: const EdgeInsets.all(2.0),
      //   child: DateTimePickerFormField(
      //     inputType: InputType.date,
      //     format: DateFormat('yyyy-MM-dd'),
      //     editable: false,
      //     controller: cdate2,
      //     decoration: InputDecoration(
      //       labelText: 'Au...',
      //       hasFloatingPlaceholder: false,
      //       icon: Icon(
      //         Icons.date_range,
      //         color: Colors.grey,
      //       ),
      //       //       border: new OutlineInputBorder(
      //       //  borderRadius: new BorderRadius.circular(20.0)),
      //     ),
      //     onChanged: (dt) => setState(() => date2 = dt),
      //   ),
      // ),
      Padding(
                     padding: const EdgeInsets.all(2.0),
                     child: TextField(
                       maxLines: 2,
                     controller: cdate2,
                     decoration: InputDecoration(
                       icon: Icon(Icons.date_range,color: Colors.grey,),
                       hintText: 'Au:\n'+date2.toString(),
                       
                     ),
                     onTap:(){_selectDate2(context);cdate2.text='';
                     
                     },
                     
                     )),
      Divider(),
      Padding(
          padding: EdgeInsets.all(2.0),
          child: IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              if (cdate1.text != null && cdate2.text != null) {
                _chargerNaiss();
                _chargerDeces();
                _chargerNaissMin();
                _chargerDecesMin();
                _chargerEvolution();
              }
            },
          )),
          Divider(),
          
      new Card(
          color: Colors.white,
          elevation: 5.0,
          child: Column(
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.all(8.0),
                height: 35,
                width: MediaQuery.of(context).size.width / 1.0,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFC90000), Color(0xFF1E1E1E)]),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Center(
                  child: new FlatButton(
                    onPressed: () {},
                    child: Text(
                      'EVOLUTION DE LA POPULATION'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              new Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                          "La population est-elle en croissance ou decroissance?"),
                      Divider(),
                      Text(
                          "Combien de personnes sont nées dans un endroid à un interval de temps donné?"),
                      Text(
                          "Combien de personnes sont mortes dans un endroid à un interval de temps donné?"),
                      Divider(),
                      SizedBox(height: 145.0, child: chartpop),
                    ],
                  ),
                ),
              )
            ],
          )),
      new Card(
          color: Colors.white,
          elevation: 5.0,
          child: Column(
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.all(8.0),
                height: 35,
                width: MediaQuery.of(context).size.width / 1.0,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFC90000), Color(0xFF1E1E1E)]),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Center(
                  child: new FlatButton(
                    onPressed: () {},
                    child: Text(
                      'IMPLICATION DES ENFANTS'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              new Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                          "Statistiques concernant les mineurs!\n-Mere de -18 ans\n-décès à -18 ans\n"),
                      Divider(),
                      Text(
                          "Combien des enfants de moins de 18 ans mettent au monde dans un interval de temps précis?"),
                      Text(
                          "Combien des enfants de moins de 18 ans sont mort dans un interval de temps précis?"),
                      Divider(),
                      SizedBox(height: 250.0, child: chartmineur),
                    ],
                  ),
                ),
              ),
            ],
          )),
      Flex(
        direction: Axis.vertical,
        children: <Widget>[
          new Card(
            color: Colors.white,
            elevation: 5.0,
            child: Column(
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.all(8.0),
                  height: 35,
                  width: MediaQuery.of(context).size.width / 1.0,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFFC90000), Color(0xFF1E1E1E)]),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Center(
                    child: new FlatButton(
                      onPressed: () {},
                      child: Text(
                        'CROISSANCE DES MORTS/MALADIE'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                new Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text("Statistique maladie/décès"),
                        Divider(),
                        Text(
                            "Une représentation graphique qui repond à la question :\nCombien de personnes sont mort de telle ou telle autre maladie?"),
                        Divider(),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 1.0,
                            child: chart3),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    ]);
  }
}

//definition des quelques classes
class Sales {
  final String maladie;
  final int sold;
  final charts.Color color;
  Sales(this.maladie, this.sold, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
