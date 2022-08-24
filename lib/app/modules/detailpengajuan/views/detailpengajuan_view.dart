import 'package:bpkh_xi_yogyakarta/app/modules/formstransaksi/controllers/formstransaksi_controller.dart';
import 'package:bpkh_xi_yogyakarta/app/modules/peminjaman/controllers/peminjaman_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../listbarang/controllers/listbarang_controller.dart';
import '../../peminjaman/models/transaksi_id.dart';
import '../controllers/detailpengajuan_controller.dart';

class DetailpengajuanView extends GetView<DetailpengajuanController> {
  final PeminjamanController identitasC = Get.put(PeminjamanController());
  final FormstransaksiController tglC = Get.put(FormstransaksiController());
  final ListbarangController barangC = Get.put(ListbarangController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              'Konfirmasi',
            ),
          ),
          titleTextStyle:
              GoogleFonts.openSans(color: Colors.black, fontSize: 18),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.help),
              color: Colors.black,
              iconSize: 25,
            )
          ],
        ),
        floatingActionButton:
            GetBuilder<ListbarangController>(builder: (snapshot) {
          return Padding(
            padding: EdgeInsets.only(left: 35),
            child: SizedBox(
                width: double.infinity,
                child: Obx(
                  () => ElevatedButton(
                    onPressed: () {
                      if (controller.isLoading.isFalse) {
                        controller.konfirmasi(snapshot.list);
                        controller.tokenKepala(identitasC.nama.text);
                        controller.tokennotif(controller.id.value,
                            identitasC.nama.text, tglC.tglmeminjam.text);
                      }
                    },
                    child: controller.isLoading.isFalse
                        ? Text("Ajukan Peminjman")
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Loading....",
                                  style: GoogleFonts.openSans(
                                      color: Color(0xFF527DAA),
                                      letterSpacing: 1.5,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                height: 8,
                                width: 8,
                                child: CircularProgressIndicator(
                                    color: Color(0xFF527DAA)),
                              )
                            ],
                          ),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 20, 139, 114)),
                  ),
                )),
          );
        }),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "DETAIL PINJAMAN :",
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18),
                    ))
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
                child: Row(
                  children: [
                    Expanded(child: Text("No Transaksi :")),
                    FutureBuilder<Transaksi?>(
                        future: controller.transaksi(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return SizedBox();
                          } else {
                            if (snapshot.hasData) {
                              return Text(snapshot.data!.data.notransaksi);
                            } else {
                              return SizedBox();
                            }
                          }
                        }),
                  ],
                ),
              ),
              Divider(endIndent: 20, indent: 20, color: Color(0xFF7F7F7F)),
              Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 5),
                child: Row(
                  children: [
                    Expanded(child: Text("Nama :")),
                    Text(identitasC.nama.text),
                  ],
                ),
              ),
              Divider(endIndent: 20, indent: 20, color: Color(0xFF7F7F7F)),
              Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 5),
                child: Row(
                  children: [
                    Expanded(child: Text("NIP :")),
                    Text(identitasC.nip.text),
                  ],
                ),
              ),
              Divider(endIndent: 20, indent: 20, color: Color(0xFF7F7F7F)),
              Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 5),
                child: Row(
                  children: [
                    Expanded(child: Text("No WA :")),
                    Text(identitasC.noWa.text),
                  ],
                ),
              ),
              Divider(endIndent: 20, indent: 20, color: Color(0xFF7F7F7F)),
              Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 5),
                child: Row(
                  children: [
                    Expanded(child: Text("TGL Pinjam :")),
                    Text(tglC.tglmeminjam.text),
                  ],
                ),
              ),
              Divider(endIndent: 20, indent: 20, color: Color(0xFF7F7F7F)),
              Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 5),
                child: Row(
                  children: [
                    Expanded(child: Text("TGL Selesai :")),
                    Text(tglC.tglkembali.text),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "DASAR PEMINJAMAN :",
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18),
                    ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 0),
                child: Row(
                  children: [
                    Expanded(child: Text(identitasC.alasan.text)),
                  ],
                ),
              ),
              Divider(endIndent: 20, indent: 20, color: Color(0xFF7F7F7F)),
              GetBuilder<ListbarangController>(builder: (snapshot) {
                return Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 0),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                          child: DataTable(
                        border: TableBorder.all(
                          width: 1.0,
                          color: Colors.grey,
                        ),
                        columns: [
                          DataColumn(
                              label: Text(
                                'Inventaris',
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.bold),
                              ),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text(
                                'Nama',
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.bold),
                              ),
                              tooltip: 'represents if user is verified.'),
                          DataColumn(
                              label: Text(
                                'Aksi',
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.bold),
                              ),
                              tooltip: 'represents if user is verified.'),
                        ],
                        rows: snapshot.list
                            .map((cell) => DataRow(cells: [
                                  DataCell(
                                    Text(cell.inventaris),
                                  ),
                                  DataCell(
                                    Text(cell.nama),
                                  ),
                                  DataCell(Material(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color.fromARGB(255, 20, 139, 114),
                                    child: InkWell(
                                        onTap: () {
                                          snapshot.delete(cell.id);
                                        },
                                        borderRadius: BorderRadius.circular(5),
                                        child: Container(
                                            padding: EdgeInsets.all(5),
                                            height: 40,
                                            width: 40,
                                            child: Center(
                                              child: Icon(
                                                Icons.delete,
                                                color: Colors.white,
                                              ),
                                            ))),
                                  )),
                                ]))
                            .toList(),
                      ))),
                );
              }),
              SizedBox(
                height: 70,
              )
            ],
          ),
        ));
  }
}
