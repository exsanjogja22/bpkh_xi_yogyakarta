import 'package:bpkh_xi_yogyakarta/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../routes/app_pages.dart';
import '../models/info_alat.dart';

class HomeController extends GetxController {
  RxInt limit = 5.obs;
  RefreshController onRefres = RefreshController();
  List<Datum> list = [];
  List<Datum> listSearch = [];
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> logout() async {
    await auth.signOut();
    Get.offAllNamed(Routes.LOGINPEGAWAI);
  }

  Stream<InfoAlat> infoAlat() async* {
    try {
      final response = await http.get(Uri.parse(
          "https://pinjamalat.bpkh11jogja.net/api/pinjam/infobarang"));
      if (response.statusCode == 200) {
        final data = infoAlatFromJson(response.body);
        yield data;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Stream<List<Datum>> infoAlat2(int limit) async* {
    try {
      final response = await http.get(Uri.parse(
          "https://pinjamalat.bpkh11jogja.net/api/pinjam/infobarang?limit=${limit.toString()}}"));
      if (response.statusCode == 200) {
        final data = infoAlatFromJson(response.body).data;
        yield data;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> search() async {
    try {
      final response = await http.get(Uri.parse(
          "https://pinjamalat.bpkh11jogja.net/api/pinjam/infobarang?limit=1000"));
      if (response.statusCode == 200) {
        final data = infoAlatFromJson(response.body).data;
        for (var i in data) {
          list.add(i);
        }
      } else {
        // ignore: avoid_print
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> toRefres() async {
    await Future.delayed(Duration(seconds: 2));
    limit.value = 5;
    onRefres.refreshCompleted();
  }

  Future<void> toLoading() async {
    await Future.delayed(Duration(seconds: 2));
    limit.value = limit.value + 5;
    onRefres.loadComplete();
  }

  @override
  void onInit() {
    search();
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

  @override
  void onReady() {
    search();
    super.onReady();
  }

  @override
  void onClose() {
    list.clear();
    super.onClose();
  }
}
