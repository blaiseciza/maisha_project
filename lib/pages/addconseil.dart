import 'dart:io';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:maisha_project/pages/conseilfull.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as Img;
import 'dart:math' as Math;
import 'package:maisha_project/components/pub.dart';
class AddConseils extends StatefulWidget {
  final Widget child;
final String idmaladie;
  AddConseils({Key key, this.child, this.idmaladie}) : super(key: key);

  _AddConseilsState createState() => _AddConseilsState();
}

class _AddConseilsState extends State<AddConseils> {
  File _image;
  TextEditingController capropos=new TextEditingController()
  ,cprevention=new TextEditingController(),
  ctraitement=new TextEditingController(),
  ctitle=new TextEditingController();
//create class getimage
Future getImageGallery() async{
var imageFile=await ImagePicker.pickImage(source: ImageSource.gallery);

final tempDir=await getTemporaryDirectory();
final path=tempDir.path;
//String title=ctitle.text;
int rand=new Math.Random().nextInt(1000000);
Img.Image image=Img.decodeImage(imageFile.readAsBytesSync());
Img.Image smallerImg=Img.copyResize(image, 500);
var compressImg=new File("$path/image_$rand.jpg")
..writeAsBytesSync(Img.encodeJpg(smallerImg,quality: 85));

setState(() {
 _image=compressImg; 
});
}
Future getImageCamera() async{
var imageFile=await ImagePicker.pickImage(source: ImageSource.camera);
final tempDir=await getTemporaryDirectory();
final path=tempDir.path;
//String title=ctitle.text;
int rand=new Math.Random().nextInt(1000000);
Img.Image image=Img.decodeImage(imageFile.readAsBytesSync());
Img.Image smallerImg=Img.copyResize(image, 500);
var compressImg=new File("$path/image_$rand.jpg")
..writeAsBytesSync(Img.encodeJpg(smallerImg,quality: 85));

setState(() {
 _image=compressImg; 
});
}
//upload image
Future upload(File imageFile,BuildContext ctx) async{
var stream=new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
var length=await imageFile.length();
//var uri=Uri.parse("http://192.168.43.156/maishaCount/connMobile/addconseil.php");
var uri=Uri.parse(PubCon.cheminPhp+"addconseil.php");
var request=new http.MultipartRequest("POST", uri);
var multipartFile=new http.MultipartFile("image", stream, length,filename: basename(imageFile.path));
request.fields['id_user_cons']=PubCon.userId;
request.fields['id_maladie_cons']='${widget.idmaladie}';
request.fields['apropos_cons']=capropos.text;
request.fields['prevention_cons']=cprevention.text;
request.fields['traitement_cons']=ctraitement.text;
request.fields['title']=ctitle.text;
request.files.add(multipartFile);
var response=await request.send();
if(response.statusCode==200){
  print("Enregistrement reussi");
  Navigator.push(ctx, MaterialPageRoute(builder: (ctx) => MyConseils(),fullscreenDialog: true));
}else{
  print("Echec d'enregistrement");
}
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("Ajouter conseils",style: TextStyle(color: Color(0xFFC90000),fontWeight: FontWeight.bold,)),
       backgroundColor: Colors.white12,
       ),
       body: ListView(
         padding: EdgeInsets.all(8.0),
         children: <Widget>[
           Container(
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.width,
             child: Card(
               elevation: 5.0,
               child: Padding(
                   padding: const EdgeInsets.all(1.0),
                   child:
                     _image==null ? new Text("No image selected!",textAlign: TextAlign.center,) : new Image.file(_image),
                 
               ),
             ),
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               RaisedButton(
                 child: Icon(Icons.image),
                 onPressed: getImageGallery,
               ),
               RaisedButton(
                 child: Icon(Icons.camera_alt),
                 onPressed: getImageCamera,
               ),
               
             ],
           ),
           Divider(),
           Padding(
             padding: const EdgeInsets.all(2.0),
             child: TextField(
               maxLines: 1,
               controller: ctitle,
               decoration: new InputDecoration(
                 hintText: "Titre",
                //  border: new OutlineInputBorder(
                //    borderRadius: new BorderRadius.circular(20.0)
                //  )
                 
               ),
             ),
           ),
           Padding(
             padding: const EdgeInsets.all(2.0),
             child: TextField(
               maxLines: 3,
               controller: capropos,
               decoration: new InputDecoration(
                 hintText: "Apropos conseil",
                //  border: new OutlineInputBorder(
                //    borderRadius: new BorderRadius.circular(20.0)
                //  )
               ),
             ),
           ),
           Padding(
             padding: const EdgeInsets.all(2.0),
             child: TextField(
               maxLines: 3,
               controller: cprevention,
               decoration: new InputDecoration(
                 hintText: "conseil Prevention",
                //  border: new OutlineInputBorder(
                //    borderRadius: new BorderRadius.circular(20.0)
                //  )
               ),
             ),
           ),
           Padding(
             padding: const EdgeInsets.all(2.0),
             child: TextField(
               maxLines: 3,
               controller: ctraitement,
               decoration: new InputDecoration(
                 hintText: "conseil traitement",
                //  border: new OutlineInputBorder(
                //    borderRadius: new BorderRadius.circular(20.0)
                //  )
               ),
             ),
           ),
           Divider(),
           Padding(
             padding: const EdgeInsets.all(2.0),
             child: RaisedButton(
               color: Colors.white,
                   child: Text("AJOUTER"),
                   onPressed: (){
                     upload(_image,context);
                   }
                 ),
           ),
         ],
       ),
    );
  }
}