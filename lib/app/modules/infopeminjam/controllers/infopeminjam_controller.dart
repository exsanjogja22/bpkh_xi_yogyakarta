

import 'dart:async';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/detail_transaksi.dart';
import '../models/peminjam.dart';
import '../models/pengajuan.dart';

class InfopeminjamController extends GetxController {

  // ignore: body_might_complete_normally_nullable
  Future<Pengajuan?> infoPengajuan() async {/// dget data info pengajuan
    try {
      final response = await http.get(Uri.parse(
          "https://pinjamalat.bpkh11jogja.net/api/pinjam/pengajuan"));//link url info pengajuan
      if (response.statusCode == 200) {
        final data = pengajuanFromJson(response.body);
        return data;
      }
    } catch (e) {
      print(e.toString());
    }
  }
   // ignore: body_might_complete_normally_nullable
   Future<Peminjam?> infoPeminjaman() async {///get data info peminjam
    try {
      final response = await http.get(Uri.parse(
          "https://pinjamalat.bpkh11jogja.net/api/pinjam/peminjam"));// info link peminjaman 
      if (response.statusCode == 200) {
        final data = peminjamFromJson(response.body);
        return data;
      }
    } catch (e) {
      print(e.toString());
    }
  }

   Stream<DetailTransaksi> detailTransaksi(String id) async* {///get detail transaksi
    try {
      final response = await http.get(Uri.parse(
          "https://pinjamalat.bpkh11jogja.net/api/pinjam/detailtransaksi?transaksiid=$id"));
      if (response.statusCode == 200) {
        final data = detailTransaksiFromJson(response.body);
        yield data;
      }
    } catch (e) {
      print(e.toString());
    }
  }
 
}
