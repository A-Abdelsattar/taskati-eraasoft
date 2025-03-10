import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper{
 static late SharedPreferences _prefs;
  static init()async{
    _prefs=await SharedPreferences.getInstance();
  }

  static setString(String key, String value)async{
   await _prefs.setString(key, value);
  }

  static getString(String key){
    return _prefs.getString(key);
  }
  static removeString(String key)async
  {
    await _prefs.remove(key);
  }
}