import 'package:bpkh_xi_yogyakarta/app/modules/newpassword/controllers/newpassword_controller.dart';
import 'package:bpkh_xi_yogyakarta/app/modules/register/controllers/register_controller.dart';
import 'package:bpkh_xi_yogyakarta/app/routes/app_pages.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KonfirmasiemailController extends GetxController {
  final RegisterController registerC = Get.put(RegisterController());
  final NewpasswordController newpasswordC = Get.put(NewpasswordController());
  RxBool isloadingVerivikasi = false.obs;
  RxBool isloadingLogin = false.obs;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> verifikasi(BuildContext context) async {
    isloadingVerivikasi.value = true;
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: registerC.email.text,
        password: newpasswordC.confrimpassword.text);
    userCredential.user!.sendEmailVerification();
    CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        title: "Terkirim",
        text: "Terkirim Ke akun email anda",
        onConfirmBtnTap: () {
          isloadingVerivikasi.value = false;

          Get.back();
        });
  }

  Future<void> login(BuildContext context) async {
    isloadingLogin.value = true;
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: registerC.email.text,
        password: newpasswordC.confrimpassword.text);
    if (userCredential.user!.emailVerified == false) {
      CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: "Gagal",
          text: "Akun Belun di verifikasi",
          onConfirmBtnTap: () {
            isloadingLogin.value = false;
            Get.back();
          });
    } else {
      isloadingLogin.value = false;
      Get.offAllNamed(Routes.HOME);
    }
  }
}
