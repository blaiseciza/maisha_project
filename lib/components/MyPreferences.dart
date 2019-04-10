import 'package:shared_preferences/shared_preferences.dart';

class MyPreferences{
  static const VIEWMALADIE="viewmaladie";
  static const NBREMALADIE="nbremaladie";
  static const DETAILMALADIE="detailmaladie";
  
static final MyPreferences instance=MyPreferences._internal();
SharedPreferences _sharedPreferences;
//my data
List<String> viewmaladie=["dd"];
  List<String> nbremaladie=["hh"];
  List<String> detailmaladie=["uu"];

  MyPreferences._internal();
  // {

  // }
  factory MyPreferences()=>instance;
  Future<SharedPreferences> get preferences async{
    if(_sharedPreferences!=null){
      return _sharedPreferences;
    }else{
      _sharedPreferences=await SharedPreferences.getInstance();
      viewmaladie=_sharedPreferences.getStringList(VIEWMALADIE);
      nbremaladie=_sharedPreferences.getStringList(NBREMALADIE);
      detailmaladie=_sharedPreferences.getStringList(DETAILMALADIE);
      return _sharedPreferences;
    }
  }
  Future<bool> commit() async{
    await _sharedPreferences.setStringList(VIEWMALADIE, viewmaladie);
    await _sharedPreferences.setStringList(NBREMALADIE, nbremaladie);
    await _sharedPreferences.setStringList(DETAILMALADIE, detailmaladie);
    return true;
  }
  Future<MyPreferences> init() async{
    _sharedPreferences=await preferences;
    return this;
  }
}