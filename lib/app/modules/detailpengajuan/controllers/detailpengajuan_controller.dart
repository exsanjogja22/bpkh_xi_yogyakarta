import 'dart:convert';

import 'package:bpkh_xi_yogyakarta/app/modules/formstransaksi/controllers/formstransaksi_controller.dart';
import 'package:bpkh_xi_yogyakarta/app/modules/peminjaman/controllers/peminjaman_controller.dart';
import 'package:bpkh_xi_yogyakarta/app/routes/app_pages.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../listbarang/models/daftar_alat.dart';
import '../../peminjaman/models/transaksi_id.dart';

class DetailpengajuanController extends GetxController {
  final PeminjamanController identitasC = Get.put(PeminjamanController());
  final FormstransaksiController tglC = Get.put(FormstransaksiController());
  RxBool isLoading = false.obs;
  RxString id = "".obs;
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  Future tokenKepala(String nama) async {
    try {
      DocumentReference<Map<String, dynamic>> data =
          db.collection("notiftokenkepala").doc('notiftoken');
      data.get().then((DocumentSnapshot snapshot) => sendNotifAddStatus(
          "$nama Melakukan peminjaman",
          "lakukan persetujuan untuk menyetujui",
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

  Future<void> tokennotif(
    String idtransaksi,
    String nama,
    String tanggalpinjam,
  ) async {
    try {
      String? token = await messaging.getToken();
      CollectionReference notofToken = db.collection("notiftokenpeminjam");
      notofToken.doc(idtransaksi).set({
        'idtransaksi': idtransaksi,
        'nama': nama,
        'createat': tanggalpinjam,
        'token': token.toString()
      });
    } catch (e) {
      print(e.toString());
    }
  }

  _showToast(String mesage, Color color) {
    Fluttertoast.showToast(
      msg: mesage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      backgroundColor: color,
      textColor: Colors.white,
    );
  }

  // ignore: body_might_complete_normally_nullable
  Future<Transaksi?> transaksi() async {
    try {
      final response = await http.get(
          Uri.parse("https://pinjamalat.bpkh11jogja.net/api/pinjam/barang"));
      if (response.statusCode == 200) {
        final data = transaksiFromJson(response.body);
        id.value = data.data.notransaksi;
        return data;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> konfirmasi(List<ListBarang> barang) async {
    isLoading.value = true;
    try {
      Map<String, dynamic> data;
      data = {
        'no_transaksi': id.value,
        'nama': identitasC.nama.text,
        'nip': identitasC.nip.text,
        'no_wa': identitasC.noWa.text,
        'tgl_pinjam': tglC.tglmeminjam.text,
        'tgl_kembali': tglC.tglkembali.text,
        'dasar_peminjaman': identitasC.alasan.text,
        'tgl_tugas_mulai': tglC.tgMulaiTugas.text,
        'tgl_tugas_selesai': tglC.tgSelesaiTugas.text,
      };
      for (int i = 0; i < barang.length; i++) {
        data.addAll({
          'databarang[$i][id]': "${barang[i].id}",
          'databarang[$i][noinventaris]': barang[i].inventaris,
          'databarang[$i][nama]': barang[i].nama,
        });
      }
      var request = http.MultipartRequest('POST',
          Uri.parse('https://pinjamalat.bpkh11jogja.net/api/pinjam/barang'));
      if (barang.isNotEmpty) {
        request.fields.addAll(data.cast());
        isLoading.value = false;
        _showToast("berhasil", Colors.green);
        Get.offAllNamed(Routes.HOME);
      } else {
        _showToast("Barang Belum Dipilh", Colors.red);
        Get.back();
      }

      isLoading.value = false;
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
        isLoading.value = false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
