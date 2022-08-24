import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../routes/app_pages.dart';
import '../../home/widget/search.dart';
import '../controllers/infopeminjam_controller.dart';
import '../models/detail_transaksi.dart';
import '../models/peminjam.dart';
import '../models/pengajuan.dart';
import '../widget/detail_barang.dart';

class InfopeminjamView extends GetView<InfopeminjamController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/logo.png'),
          ),
          backgroundColor: Colors.white,
          title: SizedBox(
            width: 200,
            height: 30,
            child: Text('Peminjaman Alat Online\nBPKH XI YOGJAKARTA',
                maxLines: 2, style: GoogleFonts.openSans(fontSize: 12)),
          ),
          titleTextStyle:
              GoogleFonts.openSans(color: Colors.black, fontSize: 12),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              icon: const Icon(Icons.search),
              color: Colors.black,
              iconSize: 25,
            )
          ],
        ),
        body: SafeArea(
            child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: DefaultTabController(
                    length: 2,
                    initialIndex: 1,
                    child: Column(children: [
                      TabBar(
                        labelColor: Colors.black,
                        labelStyle: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                        ),
                        indicatorColor: Color.fromARGB(255, 20, 139, 114),
                        tabs: const [
                          Tab(
                            text: 'Daftar Peminjam',
                          ),
                          Tab(
                            text: 'Daftar Pengajuan',
                          ),
                        ],
                      ),
                      Expanded(
                          child: TabBarView(children: [
                        FutureBuilder<Peminjam?>(
                            future: controller.infoPeminjaman(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: Color.fromARGB(255, 20, 139, 114),
                                  ),
                                );
                              } else {
                                if (snapshot.hasData) {
                                  final data = snapshot.data!.data;
                                  return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: SingleChildScrollView(
                                          child: DataTable(
                                              columns: [
                                            DataColumn(
                                                label: Text(
                                                  'Nama',
                                                  style: GoogleFonts.openSans(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                tooltip:
                                                    'represents if user is verified.'),
                                            DataColumn(
                                                label: Text(
                                                  'Tanggal Kembali',
                                                  style: GoogleFonts.openSans(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                tooltip:
                                                    'represents if user is verified.'),
                                            DataColumn(
                                                label: Text(
                                                  'Barang',
                                                  style: GoogleFonts.openSans(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                tooltip:
                                                    'represents if user is verified.'),
                                          ],
                                              rows: data
                                                  .map(
                                                      (data) => DataRow(cells: [
                                                            DataCell(Text(
                                                                data.nama,
                                                                style: GoogleFonts
                                                                    .openSans(
                                                                  fontSize: 12,
                                                                ))),
                                                            DataCell(Text(
                                                                " ${DateFormat("EEEE, d MMMM yyyy", "id_ID").format(data.tanggalKembali).toString()}",
                                                                style: GoogleFonts
                                                                    .openSans(
                                                                  fontSize: 12,
                                                                ))),
                                                            DataCell(Material(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      20,
                                                                      139,
                                                                      114),
                                                              child: InkWell(
                                                                onTap: () {
                                                                  showModalBottomSheet(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      isScrollControlled:
                                                                          true,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return DetailBarang(
                                                                            id: data.id);
                                                                      });
                                                                },
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                child: Container(
                                                                    padding: EdgeInsets.all(5),
                                                                    height: 40,
                                                                    width: 40,
                                                                    child: Center(
                                                                        child: StreamBuilder<DetailTransaksi>(
                                                                            stream: controller.detailTransaksi(data.id.toString()),
                                                                            builder: (context, snapshot) {
                                                                              if (snapshot.hasData) {
                                                                                final data = snapshot.data!.data;
                                                                                return Text(
                                                                                  data.daftarBarang.length.toString(),
                                                                                  style: GoogleFonts.openSans(color: Colors.white),
                                                                                );
                                                                              } else {
                                                                                return Text(
                                                                                  "0",
                                                                                  style: GoogleFonts.openSans(color: Colors.white),
                                                                                );
                                                                              }
                                                                            }))),
                                                              ),
                                                            ))
                                                          ]))
                                                  .toList())));
                                } else {
                                  return Center(
                                    child: Text(
                                      'Tidak ada data',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  );
                                }
                              }
                            }),
                        FutureBuilder<Pengajuan?>(
                            future: controller.infoPengajuan(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: Color.fromARGB(255, 20, 139, 114),
                                  ),
                                );
                              } else {
                                if (snapshot.hasData) {
                                  final data = snapshot.data!.data;
                                  return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: SingleChildScrollView(
                                          child: DataTable(
                                              columns: [
                                            DataColumn(
                                                label: Text(
                                                  'Nama',
                                                  style: GoogleFonts.openSans(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                tooltip:
                                                    'represents if user is verified.'),
                                            DataColumn(
                                                label: Text(
                                                  'Status Alat',
                                                  style: GoogleFonts.openSans(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                tooltip:
                                                    'represents if user is verified.'),
                                            DataColumn(
                                                label: Text(
                                                  'Total',
                                                  style: GoogleFonts.openSans(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                tooltip:
                                                    'represents if user is verified.'),
                                          ],
                                              rows: data
                                                  .map(
                                                      (data) => DataRow(cells: [
                                                            DataCell(Text(
                                                                data.nama,
                                                                style: GoogleFonts
                                                                    .openSans(
                                                                  fontSize: 12,
                                                                ))),
                                                            DataCell(Column(
                                                              children: [
                                                                Container(
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .amber,
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                5)),
                                                                    child: Text(
                                                                        "operator: ${data.accAdmin}",
                                                                        style: GoogleFonts
                                                                            .openSans(
                                                                          fontSize:
                                                                              12,
                                                                        ))),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Container(
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .amber,
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                5)),
                                                                    child: Text(
                                                                        "ketua: ${data.accPengawas}",
                                                                        style: GoogleFonts
                                                                            .openSans(
                                                                          fontSize:
                                                                              12,
                                                                        ))),
                                                              ],
                                                            )),
                                                            DataCell(
                                                              Material(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        20,
                                                                        139,
                                                                        114),
                                                                child: InkWell(
                                                                    onTap: () {
                                                                      showModalBottomSheet(
                                                                          backgroundColor: Colors
                                                                              .transparent,
                                                                          isScrollControlled:
                                                                              true,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return DetailBarang(id: data.id);
                                                                          });
                                                                    },
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                    child: Container(
                                                                        padding: EdgeInsets.all(5),
                                                                        height: 40,
                                                                        width: 40,
                                                                        child: Center(
                                                                          child:
                                                                              Icon(
                                                                            Icons.search,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ))),
                                                              ),
                                                            )
                                                          ]))
                                                  .toList())));
                                } else {
                                  return Center(
                                    child: Text(
                                      'Tidak Ada data',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  );
                                }
                              }
                            }),
                      ]))
                    ])))),
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.fixedCircle,
          backgroundColor: Color.fromARGB(255, 20, 139, 114),
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.info_outline, title: 'Peminjam'),
            TabItem(icon: Icons.add, title: 'add'),
            TabItem(icon: Icons.call, title: 'Kontak'),
            TabItem(icon: Icons.more_vert_sharp, title: 'More'),
          ],
          initialActiveIndex: 1, //optional, default as 0
          onTap: (int i) {
            switch (i) {
              case 0:
                Get.offAllNamed(Routes.HOME);
                break;
              case 1:
                break;

              case 2:
                Get.toNamed(Routes.PEMINJAMAN);
                break;
              case 3:
                Get.offAllNamed(Routes.KONTAK);
                break;
              case 4:
                Get.toNamed(Routes.MORE);
                break;
            }
          },
        ));
  }
}
