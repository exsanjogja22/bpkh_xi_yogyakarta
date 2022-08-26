import 'package:bpkh_xi_yogyakarta/app/modules/listbarang/models/daftar_alat.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../home/models/info_alat.dart';
import '../widget/menu_items_widget.dart';

class ListbarangController extends GetxController {
  RxInt limit = 5.obs;
  RxInt kategori = 0.obs;

  RefreshController onRefres = RefreshController();
  MenuItemsWidget filter = MenuItemsWidget();
  List<ListBarang> list = [];
  List<Datum> listbarang = [];
  List<Datum> listSearch = [];

  _showToast(String mesage, Color color) {
    Fluttertoast.showToast(
      msg: mesage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      backgroundColor: color,
      textColor: Colors.white,
    );
  }

  Stream<InfoAlat> infoAlat2(int limit, int kategori) async* {
    try {
      final response = await http.get(Uri.parse(
          "https://pinjamalat.bpkh11jogja.net/api/pinjam/infobarang?limit=${limit.toString()}&kategori=${kategori.toString()}"));
      if (response.statusCode == 200) {
        final data = infoAlatFromJson(response.body);
        yield data;
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }

  Future<void> toRefres() async {
    Future.delayed(Duration(seconds: 2));
    limit.value = 5;
    onRefres.refreshCompleted();
  }

  Future<void> toLoading() async {
    Future.delayed(Duration(seconds: 5));
    limit.value = limit.value + 5;
    onRefres.loadComplete();
  }

  Future<void> addAlat(int id, String inventaris, String nama) async {
    final data = list.any((element) => element.id == id);
    if (data == true) {
      _showToast("Barang sudah Ditambahkan", Colors.red);
    } else {
      _showToast("Berhasil", Colors.green);
      list.addAll([ListBarang(id: id, inventaris: inventaris, nama: nama)]);
    }
  }

  Future<void> delete(int id) async {
    list.removeWhere((item) => item.id == id);
    update();
  }

  Future<void> searchPeminjamn() async {
    try {
      final response = await http.get(Uri.parse(
          "https://pinjamalat.bpkh11jogja.net/api/pinjam/infobarang?limit=1000"));
      if (response.statusCode == 200) {
        final data = infoAlatFromJson(response.body).data;
        for (var i in data!) {
          listbarang.add(i);
        }
      } else {
        // ignore: avoid_print
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void onInit() {
    searchPeminjamn();
    filter.filter();
    super.onInit();
  }

  @override
  void onReady() {
    searchPeminjamn();
    super.onReady();
  }

  @override
  void onClose() {
    MenuItemsWidget.listItemsMenu.clear();
    searchPeminjamn();
    super.onClose();
  }
}
