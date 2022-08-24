import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../main.dart';
import '../models/aproval_models.dart';
import '../models/detail_aproval_models.dart';

class AprovalbarangController extends GetxController {
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  Future<Aproval?> aproval() async {
    SharedPreferences getToken = await SharedPreferences.getInstance();
    String? auth = getToken.getString("token");
    try {
      final response = await http.get(
        Uri.parse('https://pinjamalat.bpkh11jogja.net/api/pengawas/konfirmasi'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': '$auth',
        },
      );
      if (response.statusCode == 200) {
        final data = aprovalFromJson(response.body);
        return data;
      } else {
        // ignore: avoid_print
        print(response.reasonPhrase);
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
    return null;
  }

  Stream<DetailAproval> detailaproval(String id) async* {
    SharedPreferences getToken = await SharedPreferences.getInstance();
    String? auth = getToken.getString("token");
    try {
      print(id);
      final response = await http.get(
        Uri.parse(
            'https://pinjamalat.bpkh11jogja.net/api/pengawas/barangdetail?id=$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': '$auth',
        },
      );
      if (response.statusCode == 200) {
        final data = detailAprovalFromJson(response.body);
        yield data;
      } else {
        // ignore: avoid_print
        print(response.reasonPhrase);
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  Future tokenPeminjam(String id) async {
    try {
      DocumentReference<Map<String, dynamic>> data =
          db.collection("notiftokenpeminjam").doc(id);
      data.get().then((DocumentSnapshot snapshot) => sendNotifAddStatus(
          "Disetujui",
          "Peminjaman Anda di setujui oleh Kepala Balai",
          "${snapshot['token']}"));
    } catch (e) {
      print(e.toString());
    }
  }

  Future sendNotifAddStatus(String title, String isi, String token) async {
    try {
      final headers = {
        'Authorization':
            'key=AAAAEJOvSyg:APA91bHUUxjsmhq6X5jxW87Pn2n3MCbBsABhHglB2yWgZGNm1X5oJeeczySQ-_1v0TkeadGp3EzysbujgEdAdk2K8R6wLECVbNUoX6XZ8JD0AQqG5ADwGYG2TPhmzzT-WIa2BJR5UZu1',
        'Content-Type': 'application/json'
      };
      var request = http.Request(
          'POST', Uri.parse('https://fcm.googleapis.com/fcm/send'));
      request.body = json.encode({
        "to": token,
        "collapse_key": "type_a",
        "notification": {
          "body": isi,
          "title": title,
        },
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> kofirmasi(String id, bool status, BuildContext context) async {
    SharedPreferences getToken = await SharedPreferences.getInstance();
    String? auth = getToken.getString("token");
    try {
      var headers = {
        'Authorization': '$auth',
      };
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'https://pinjamalat.bpkh11jogja.net/api/pengawas/accketua'));
      request.fields.addAll({'id': id, 'status': status.toString()});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        CoolAlert.show(
            context: context,
            type: CoolAlertType.success,
            title: "Berhasil",
            text: "Konfirmasi Telah Berhasil",
            onConfirmBtnTap: () {
              aproval();
              Get.back();
              Get.back();
            });
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      Exception(e);
    }
  }

  @override
  void onInit() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: 'launch_background',
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
    });
    super.onInit();
  }
}
