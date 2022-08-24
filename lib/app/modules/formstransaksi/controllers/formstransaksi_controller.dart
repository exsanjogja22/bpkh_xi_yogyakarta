import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../peminjaman/models/transaksi_id.dart';

class FormstransaksiController extends GetxController {
  TextEditingController tglkembali = TextEditingController();
  TextEditingController tglmeminjam = TextEditingController();
  TextEditingController tgMulaiTugas = TextEditingController();
  TextEditingController tgSelesaiTugas = TextEditingController();

  DateTime? _datePicked;
  void showDatePickerNowTglPinjam(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2030))
        .then((value) {
      if (value != null) {
        _datePicked = value;
        final data = DateFormat("yyyy-MM-dd").format(_datePicked!);
        tglmeminjam.text = data.toString();
      }

      return;
    });
  }

  void showDatePickerNowTglKembali(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.parse(tglkembali.text),
            firstDate: DateTime.now(),
            lastDate: DateTime(2030))
        .then((value) {
      if (value != null) {
        _datePicked = value;
        final data = DateFormat("yyyy-MM-dd").format(_datePicked!);
        tglkembali.text = data.toString();
      }

      return;
    });
  }

  void showDatePickerNowTglMulaiTugas(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2030))
        .then((value) {
      if (value != null) {
        _datePicked = value;
        final data = DateFormat("yyyy-MM-dd").format(_datePicked!);
        tgMulaiTugas.text = data.toString();
      }

      return;
    });
  }

  void showDatePickerNowTglSelesaiTugas(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.parse(tgSelesaiTugas.text),
            firstDate: DateTime.now(),
            lastDate: DateTime(2030))
        .then((value) {
      if (value != null) {
        _datePicked = value;
        final data = DateFormat("yyyy-MM-dd").format(_datePicked!);
        tgSelesaiTugas.text = data.toString();
      }

      return;
    });
  }

  // ignore: body_might_complete_normally_nullable
  Future<Transaksi?> transaksi() async {
    try {
      final response = await http.get(
          Uri.parse("https://pinjamalat.bpkh11jogja.net/api/pinjam/barang"));
      if (response.statusCode == 200) {
        final data = transaksiFromJson(response.body);
        return data;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void onInit() {
    tglmeminjam.text =
        DateFormat("yyyy-MM-dd").format(DateTime.now()).toString();
    tgMulaiTugas.text =
        DateFormat("yyyy-MM-dd").format(DateTime.now()).toString();
    tglkembali.text = DateFormat("yyyy-MM-dd")
        .format(DateTime(DateTime.now().year.toInt(),
            DateTime.now().month.toInt(), DateTime.now().day.toInt() + 7))
        .toString();
    tgSelesaiTugas.text = DateFormat("yyyy-MM-dd")
        .format(DateTime(DateTime.now().year.toInt(),
            DateTime.now().month.toInt(), DateTime.now().day.toInt() + 7))
        .toString();
    super.onInit();
  }
}
