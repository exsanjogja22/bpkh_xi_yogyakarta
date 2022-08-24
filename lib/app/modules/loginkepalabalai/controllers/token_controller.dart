import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenController extends GetxController {
  void tokenCache(String token) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    await localStorage.setString("token", token);
  }
}
