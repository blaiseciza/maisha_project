import 'package:flutter/material.dart';
//import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
//import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:async/async.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:maisha_project/login_page.dart';
//import 'package:maisha_project/pages/conseilfull.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as Img;
import 'dart:math' as Math;
import 'package:maisha_project/components/pub.dart';

class MyRegiPage extends StatefulWidget {
  @override
  _MyRegiPageState createState() => _MyRegiPageState();
}

class _MyRegiPageState extends State<MyRegiPage> {
  File _image;
  TextEditingController cusername = new TextEditingController(),
      cpassword = new TextEditingController(),
      //csexe = new TextEditingController(),
      cdate = new TextEditingController();
//create class getimage
  Future getImageGallery() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);

    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
//String title=ctitle.text;
    int rand = new Math.Random().nextInt(1000000);
    Img.Image image = Img.decodeImage(imageFile.readAsBytesSync());
    Img.Image smallerImg = Img.copyResize(image, 500);
    var compressImg = new File("$path/image_$rand.jpg")
      ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));

    setState(() {
      _image = compressImg;
    });
  }

  Future getImageCamera() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
//String title=ctitle.text;
    int rand = new Math.Random().nextInt(1000000);
    Img.Image image = Img.decodeImage(imageFile.readAsBytesSync());
    Img.Image smallerImg = Img.copyResize(image, 500);
    var compressImg = new File("$path/image_$rand.jpg")
      ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));

    setState(() {
      _image = compressImg;
    });
  }

//upload image
  Future saveUser(File imageFile, BuildContext ctx) async {
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse(PubCon.cheminPhp + "adduser.php");
    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile("image", stream, length,
        filename: basename(imageFile.path));
    request.fields['username'] = cusername.text;
    request.fields['passuser'] = cpassword.text;
    request.fields['sexeuser'] =''+_selection;
    request.fields['date_naiss_user'] = date.toString();
    request.files.add(multipartFile);
    var response = await request.send();
    if (response.statusCode == 200) {
      print("Enregistrement reussi");
      PubCon.showDialogcz(ctx, "Confirm", "Enregistrement reussi");
      Navigator.pushReplacement(
          ctx,
          MaterialPageRoute(
              builder: (ctx) => MyAppLog(), fullscreenDialog: true));
    } else {
      print("Echec d'enregistrement");
      PubCon.showDialogcz(ctx, "Désolé!", "Echec d'Enregistrement");
    }
  }

  String msg = '';
  // String sexe;
  // List<DropdownMenuItem<String>> items =[
  //   new DropdownMenuItem(child: new Text('M'),
  //   value: 'M',
  //   ),
  //   new DropdownMenuItem(child: new Text('F'),
  //   value: 'F',
  //   ),
  // ];
  final List<String> _items = ['M', 'F'].toList();

  String _selection;
  DateTime date;
  @override
  void initState() {
    _selection = _items.first;
    super.initState();
  }
// @override
//   void initState() {
//     SystemChrome.setEnabledSystemUIOverlays([]);
//     super.initState();
//   }
Future<Null> _selectDate(BuildContext context) async{
  final DateTime picked = await
  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2099),

                  );
                  setState(() {
                   date =picked;
                  });
}
  @override
  Widget build(BuildContext context) {
    final dropdownMenuOptions = _items
        .map((String item) =>
            new DropdownMenuItem<String>(value: item, child: new Text(item)))
        .toList();
    return Scaffold(
      appBar: AppBar(centerTitle: true,
          title: Text("Inscription",style: TextStyle(color: Colors.white),), backgroundColor: Color.fromRGBO(176, 9, 9, 1)),
     
      body: 
      //Container(
        //============
        //child: 
        ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFC90000), Color(0xFF1E1E1E)],
                  ),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(20))),
              
                    //radius: 40.0,
                    //backgroundColor: Color(0xFFC90000),
                      child: Container(
                        width: MediaQuery.of(context).size.width/2,
              height: MediaQuery.of(context).size.height / 2,
                        child: Align(
                    alignment: Alignment.center,
                    child: _image == null
                          ? Icon(
                              Icons.person,
                              size: 85.0,
                              color: Colors.white,
                            )
                          : new Image.file(_image),
                  ),
                      )),

              Padding(padding:EdgeInsets.only(top: 32.0), ),
            // Container(
            //   height: MediaQuery.of(context).size.height / 1,
            //   width: MediaQuery.of(context).size.width,
            //   padding: EdgeInsets.only(top: 32.0),
            //   child: ListView(
            //     children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.red,
                        child: Icon(Icons.image),
                        onPressed: getImageGallery,
                        
                      ),
                      RaisedButton(
                        color: Colors.red,
                        child: Icon(Icons.camera_alt),
                        onPressed: getImageCamera,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: TextField(
                        controller: cusername,
                        
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.text_fields,
                              color: Colors.grey,
                            ),
                //             border: new OutlineInputBorder(
                //      borderRadius: new BorderRadius.circular(20.0)
                //  ),
                            hintText: 'Nom d\'utilisateur'),
                            
                      ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: TextField(
                      maxLines: 1,
                        controller: cpassword,
                        obscureText: true,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.vpn_key,
                              color: Colors.grey,
                            ),
                    //         border: new OutlineInputBorder(
                    //  borderRadius: new BorderRadius.circular(20.0)),
                            hintText: 'Mot de Passe'),
                      ),
                  ),
                  
                  
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: new DropdownButtonFormField(
                        value: _selection,
                        items: dropdownMenuOptions,
                        onChanged: (s) {
                          setState(() {
                            _selection = s;
                          });
                        },
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.people,
                            color: Colors.grey,
                          ),
                    //       border: new OutlineInputBorder(
                    //  borderRadius: new BorderRadius.circular(20.0)),
                          hintText: '       ---Sexe---',
                        ),
                      ),
                    ),
                  
                  
                   Padding(
                     padding: const EdgeInsets.all(2.0),
                     child: TextField(
                       maxLines: 2,
                     controller: cdate,
                     decoration: InputDecoration(
                       icon: Icon(Icons.date_range,color: Colors.grey,),
                       hintText: 'Date de Naissance:\n'+date.toString(),
                       
                     ),
                     onTap:(){_selectDate(context);
                     
                     },
                     
                     )),
                    //  DateTimePickerFormField(
                    //     inputType: InputType.date,
                    //     format: DateFormat('yyyy-MM-dd'),
                    //     editable: false,
                    //     controller: cdate,
                        
                    //     decoration: InputDecoration(
                    //       labelText: 'Date Naissance',
                    //       hasFloatingPlaceholder: false,
                    //       icon: Icon(
                    //         Icons.calendar_view_day,
                    //         color: Colors.grey,
                    //       ),
                    //       border: new OutlineInputBorder(
                    //  borderRadius: new BorderRadius.circular(20.0)),
                      //   ),
                      //   onChanged: (dt) => setState(() => date = dt),
                      // ),
                   
                  Container(padding: EdgeInsets.all(8.0),),
                  //Spacer(),
                  Container(
                    
                    height: 55,
                    width: MediaQuery.of(context).size.width / 1.0,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFFC90000), Color(0xFF1E1E1E)]),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          saveUser(_image, context);
                        },
                        child: Text(
                          'Créer'.toUpperCase(),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(padding: EdgeInsets.all(8.0),),
                  //Spacer()
                  
                  // InkWell(
                  //   onTap:(){_selectDate(context);},
                  //   child: Text("ghhghgfhgfhghghfh"+date.toString()),
                  // )

          ],
        ),
      //),
    );
  }
}
