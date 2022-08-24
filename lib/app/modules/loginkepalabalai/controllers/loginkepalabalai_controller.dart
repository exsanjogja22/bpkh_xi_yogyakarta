import 'package:bpkh_xi_yogyakarta/app/modules/loginkepalabalai/controllers/token_controller.dart';
import 'package:bpkh_xi_yogyakarta/app/modules/loginkepalabalai/models/login_models.dart';
import 'package:bpkh_xi_yogyakarta/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginkepalabalaiController extends GetxController {
  final token = Get.put(TokenController());
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  RxString pesan = "".obs;
  RxBool isObscure = true.obs;
  RxBool isloading = false.obs;

  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> tokennotif() async {
    try {
      String? token = await messaging.getToken();
      CollectionReference notofToken = db.collection("notiftokenkepala");
      notofToken.doc("notiftoken").update({
        'createat': DateTime.now().toIso8601String(),
        'token': token.toString()
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> login(BuildContext context) async {
    isloading.value = true;
    try {
      if (username.text.isNotEmpty && password.text.isNotEmpty) {
        final response = await http.post(
            Uri.parse('https://pinjamalat.bpkh11jogja.net/login/process'),
            body: {'username': username.text, 'password': password.text});
        if (response.statusCode == 200) {
          final auth = loginFromJson(response.body);
          for (var i in auth.pesan!) {
            pesan.value = i;
          }
          if (auth.status == true) {
            token.tokenCache(auth.token.toString());
            String? cekToken = auth.token;
            if (cekToken!.isNotEmpty) {
              tokennotif();
              CoolAlert.show(
                  context: context,
                  type: CoolAlertType.success,
                  title: "Berhasil",
                  text: "Kamu Berhasil Login!",
                  onConfirmBtnTap: () {
                    isloading.value = false;

                    Get.offAllNamed(Routes.HOMEKEPALABALAI);
                  });
            }
          } else {
            CoolAlert.show(
                context: context,
                type: CoolAlertType.error,
                title: "Gagal",
                text: pesan.value,
                onConfirmBtnTap: () {
                  isloading.value = false;
                  Get.back();
                });
          }
        } else {
          CoolAlert.show(
              context: context,
              type: CoolAlertType.error,
              title: "Gagal",
              text: "Kamu tidak Terhubung Ke Internet",
              onConfirmBtnTap: () {
                isloading.value = false;
                Get.back();
              });
        }
      } else {
        CoolAlert.show(
            context: context,
            type: CoolAlertType.info,
            title: "Peringatan",
            text: "Username & Password  Tidak Boleh Kosong",
            onConfirmBtnTap: () {
              isloading.value = false;
              Get.back();
            });
      }
    } catch (e) {
      Exception(e);
    }
  }
}
