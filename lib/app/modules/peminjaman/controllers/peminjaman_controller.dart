
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/transaksi_id.dart';

class PeminjamanController extends GetxController {
  TextEditingController nama = TextEditingController();
  TextEditingController nip = TextEditingController();
  TextEditingController noWa = TextEditingController();
  TextEditingController alasan = TextEditingController();

  // ignore: body_might_complete_normally_nullable
  Future<Transaksi?> transaksi() async {
    try {
      final response = await http.get(Uri.parse(
          "https://pinjamalat.bpkh11jogja.net/api/pinjam/barang"));
      if (response.statusCode == 200) {
        final data = transaksiFromJson(response.body);
        return data;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
