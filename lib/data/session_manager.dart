
import 'package:shared_preferences/shared_preferences.dart';


 final Future<SharedPreferences>_prefs=SharedPreferences.getInstance();

class SessionManager {
  static SharedPreferences? preference;
  static String token ="token";

 static Future init() async {
    preference = await SharedPreferences.getInstance();
  }
 static dynamic setToken(String _token){
   return preference!.setString(token, _token);
  }
static dynamic  getToken(){
    return preference!.getString(token);
  }

   static logOut()async{
           SharedPreferences? prefs=await _prefs;
                prefs?.clear();
                
                
   }
}