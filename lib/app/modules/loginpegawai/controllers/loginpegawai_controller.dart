import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';

class LoginpegawaiController extends GetxController {
  RxBool isloading = false.obs;
  RxBool isObscure = true.obs;
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  _showToast(String mesage) {
    Fluttertoast.showToast(
      msg: mesage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> login(BuildContext context) async {
    isloading.value = true;
    if (emailC.text.isNotEmpty && passwordC.text.isNotEmpty) {
      try {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
            email: emailC.text, password: passwordC.text);
        print(userCredential.user);
        if (userCredential.user != null) {
          if (userCredential.user!.emailVerified == false) {
            isloading.value = false;
            Get.defaultDialog(
                titleStyle: GoogleFonts.openSans(
                  color: Colors.black,
                ),
                middleTextStyle: GoogleFonts.openSans(
                  color: Colors.black,
                ),
                title: "Akun Belum Terverifikasi",
                middleText:
                    "Kamu Belum Verifikasi Akun Ini. Lakukan verivikasi email kamu",
                radius: 0,
                actions: [
                  ElevatedButton(
                      onPressed: (() async {
                        userCredential.user!.sendEmailVerification();
                        _showToast("Tekirim");
                        await FirebaseAuth.instance.signOut();
                        Get.back();
                      }),
                      child: Text("Verifikasi")),
                  OutlinedButton(
                      onPressed: () => Get.back(), child: Text("Batal")),
                ]);
            _showToast("Akun Belum Terverifikasi");
            isloading.value = false;
          } else {
            CoolAlert.show(
                context: context,
                type: CoolAlertType.success,
                title: "Berhasil",
                text: "Berhasil Masuk",
                onConfirmBtnTap: () {
                  isloading.value = false;
                  Get.offAllNamed(Routes.HOME);
                });
          }
        } else {
          CoolAlert.show(
              context: context,
              type: CoolAlertType.error,
              title: "Gagal",
              text: "Terjadi Kesalahan",
              onConfirmBtnTap: () {
                isloading.value = false;
                Get.back();
              });
        }
      } on FirebaseAuthException catch (e) {
        print(e.code);
        if (e.code == "invalid-email") {
          CoolAlert.show(
              context: context,
              type: CoolAlertType.error,
              title: "Gagal",
              text: "Email Tidak benar",
              onConfirmBtnTap: () {
                isloading.value = false;
                Get.back();
              });
        } else if (e.code == "user-not-found") {
          CoolAlert.show(
              context: context,
              type: CoolAlertType.error,
              title: "Gagal",
              text: "Email & password  Tidak terdaftar",
              onConfirmBtnTap: () {
                isloading.value = false;
                Get.back();
              });
        } else {
          CoolAlert.show(
              context: context,
              type: CoolAlertType.error,
              title: "Gagal",
              text: "Terjadi Kesalahan",
              onConfirmBtnTap: () {
                isloading.value = false;
                Get.back();
              });
        }
      }
    } else {
      CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: "Gagal",
          text: "Password & Username Kosong",
          onConfirmBtnTap: () {
            isloading.value = false;
            Get.back();
          });
    }
  }
}
