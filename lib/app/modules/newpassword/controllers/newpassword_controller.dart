import 'package:bpkh_xi_yogyakarta/app/modules/register/controllers/register_controller.dart';
import 'package:bpkh_xi_yogyakarta/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class NewpasswordController extends GetxController {
  RegisterController registerC = Get.put(RegisterController());
  RxBool isObscure = true.obs;
  RxBool isloading = false.obs;
  RxBool isloadingAddPegawai = true.obs;
  TextEditingController newpassword = TextEditingController();
  TextEditingController confrimpassword = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  Future<void> register(BuildContext context) async {
    isloading.value = true;
    try {
      if (newpassword.text == confrimpassword.text) {
        UserCredential pegawaiCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: registerC.email.text, password: newpassword.text);
        if (pegawaiCredential.user != null) {
          String idUser = pegawaiCredential.user!.uid;
          await db.collection("datapegawai").doc(idUser).set({
            "nama": registerC.name.text,
            "nip": registerC.nip.text,
            "createAt": DateTime.now().toString()
          });
          isloading.value = false;
          Get.toNamed(Routes.KONFIRMASIEMAIL);
        }
        isloading.value = false;
      } else {
        isloading.value = false;
        CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            title: "Gagal",
            text: "Password Tidak valid",
            onConfirmBtnTap: () {
              isloading.value = false;
              Get.back();
            });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        isloading.value = false;
        CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            title: "Gagal",
            text: "Password lemah",
            onConfirmBtnTap: () {
              isloading.value = false;
              Get.back();
            });
      } else if (e.code == "email-already-in-use") {
        isloading.value = false;
        CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            title: "Gagal",
            text: "Email Telah di gunakan",
            onConfirmBtnTap: () {
              isloading.value = false;
              Get.back();
            });
      } else {
        isloading.value = false;
        CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            title: "Gagal",
            text: "Terjadi Kesalahan",
            onConfirmBtnTap: () {
              isloading.value = false;
              Get.back();
            });
        print(e.code);
      }
    }
  }
}
