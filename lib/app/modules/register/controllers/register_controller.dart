import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RxBool isloading = false.obs;
  TextEditingController name = TextEditingController();
  TextEditingController nip = TextEditingController();
  TextEditingController email = TextEditingController();
}
