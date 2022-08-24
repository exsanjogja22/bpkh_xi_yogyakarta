import 'package:bpkh_xi_yogyakarta/app/modules/aprovalbarang/models/aproval_models.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../routes/app_pages.dart';
import '../../home/widget/search.dart';
import '../../infopeminjam/controllers/infopeminjam_controller.dart';
import '../../infopeminjam/models/pengajuan.dart';
import '../../infopeminjam/widget/detail_barang.dart';
import '../controllers/aprovalbarang_controller.dart';
import '../widget/detail_barang.dart';

class AprovalbarangView extends GetView<AprovalbarangController> {
  @override
  Widget build(BuildContext context) {
    final infopeminjamController = Get.put(InfopeminjamController());
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
        titleTextStyle: GoogleFonts.openSans(color: Colors.black, fontSize: 12),
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
                      labelStyle: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                      ),
                      indicatorColor: Color.fromARGB(255, 20, 139, 114),
                      tabs: const [
                        Tab(
                          text: 'Daftar Persetujuan',
                        ),
                        Tab(
                          text: 'Daftar Pengajuan',
                        ),
                      ],
                    ),
                    Expanded(
                        child: TabBarView(children: [
                      FutureBuilder<Aproval?>(
                          future: controller.aproval(),
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
                                                'id Transaksi',
                                                style: GoogleFonts.openSans(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                              tooltip:
                                                  'represents if user is verified.'),
                                          DataColumn(
                                              label: Text('Nama',
                                                  style: GoogleFonts.openSans(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12)),
                                              tooltip:
                                                  'represents if user is verified.'),
                                          DataColumn(
                                              label: Text('Tanggal Pinjam',
                                                  style: GoogleFonts.openSans(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12)),
                                              tooltip:
                                                  'represents if user is verified.'),
                                          DataColumn(
                                            label: Text('Tanggal Kembali',
                                                style: GoogleFonts.openSans(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12)),
                                            tooltip:
                                                'represents if user is verified.',
                                          ),
                                          DataColumn(
                                              label: Text('Status',
                                                  style: GoogleFonts.openSans(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12)),
                                              tooltip:
                                                  'represents if user is verified.'),
                                          DataColumn(
                                              label: Text('Acc Ketua',
                                                  style: GoogleFonts.openSans(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12)),
                                              tooltip:
                                                  'represents if user is verified.'),
                                          DataColumn(
                                              label: Text('Aksi',
                                                  style: GoogleFonts.openSans(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12)),
                                              tooltip:
                                                  'represents if user is verified.'),
                                        ],
                                            rows: data!
                                                .map((data) => DataRow(cells: [
                                                      DataCell(Text(
                                                          data.idTransaksi!,
                                                          style: GoogleFonts
                                                              .openSans(
                                                                  fontSize:
                                                                      12))),
                                                      DataCell(Text(data.nama!,
                                                          style: GoogleFonts
                                                              .openSans(
                                                                  fontSize:
                                                                      12))),
                                                      DataCell(Text(
                                                          " ${DateFormat("EEEE, d MMMM yyyy", "id_ID").format(data.tanggalPinjam!).toString()}",
                                                          style: GoogleFonts
                                                              .openSans(
                                                                  fontSize:
                                                                      12))),
                                                      DataCell(Text(
                                                          " ${DateFormat("EEEE, d MMMM yyyy", "id_ID").format(data.tanggalKembali!).toString()}",
                                                          style: GoogleFonts
                                                              .openSans(
                                                                  fontSize:
                                                                      12))),
                                                      DataCell(Container(
                                                          padding:
                                                              EdgeInsets.all(5),
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.amber,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: Text(
                                                              "${data.status}",
                                                              style: GoogleFonts
                                                                  .openSans(
                                                                      fontSize:
                                                                          12)))),
                                                      DataCell(Container(
                                                          padding:
                                                              EdgeInsets.all(5),
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.amber,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: Text(
                                                              "Perlu ${data.statusPengawas}",
                                                              style: GoogleFonts
                                                                  .openSans(
                                                                      fontSize:
                                                                          12)))),
                                                      DataCell(Material(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: Color.fromARGB(
                                                            255, 20, 139, 114),
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
                                                                    return DetailBarangAproval(
                                                                      id: data
                                                                          .id!,
                                                                      controller:
                                                                          controller,
                                                                    );
                                                                  });
                                                            },
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            child: Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(5),
                                                                height: 40,
                                                                width: 40,
                                                                child: Center(
                                                                    child: Icon(
                                                                  Icons.add,
                                                                  color: Colors
                                                                      .white,
                                                                )))),
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
                          future: infopeminjamController.infoPengajuan(),
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
                                              label: Text('Nama',
                                                  style: GoogleFonts.openSans(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12)),
                                              tooltip:
                                                  'represents if user is verified.'),
                                          DataColumn(
                                              label: Text('Status Alat',
                                                  style: GoogleFonts.openSans(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12)),
                                              tooltip:
                                                  'represents if user is verified.'),
                                          DataColumn(
                                              label: Text('Total',
                                                  style: GoogleFonts.openSans(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12)),
                                              tooltip:
                                                  'represents if user is verified.'),
                                        ],
                                            rows: data
                                                .map((data) => DataRow(cells: [
                                                      DataCell(Text(data.nama,
                                                          style: GoogleFonts
                                                              .openSans(
                                                                  fontSize:
                                                                      12))),
                                                      DataCell(Column(
                                                        children: [
                                                          Container(
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .amber,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                              child: Text(
                                                                  "operator: ${data.accAdmin}",
                                                                  style: GoogleFonts
                                                                      .openSans(
                                                                          fontSize:
                                                                              12))),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Container(
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .amber,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                              child: Text(
                                                                  "ketua: ${data.accPengawas}",
                                                                  style: GoogleFonts
                                                                      .openSans(
                                                                          fontSize:
                                                                              12))),
                                                        ],
                                                      )),
                                                      DataCell(
                                                        Material(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Color.fromARGB(
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
                                                                          id: data
                                                                              .id);
                                                                    });
                                                              },
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              child: Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  height: 40,
                                                                  width: 40,
                                                                  child: Center(
                                                                    child: Icon(
                                                                      Icons
                                                                          .search,
                                                                      color: Colors
                                                                          .white,
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
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
              backgroundColor: Color.fromARGB(255, 20, 139, 114)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list_sharp,
                size: 18,
              ),
              label: 'Konfirmasi',
              backgroundColor: Color.fromARGB(255, 20, 139, 114)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.trending_up_rounded,
                size: 18,
              ),
              label: 'Statistik',
              backgroundColor: Color.fromARGB(255, 20, 139, 114)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.call,
                size: 18,
              ),
              label: 'Kontak',
              backgroundColor: Color.fromARGB(255, 20, 139, 114)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.more_vert_sharp,
                size: 18,
              ),
              label: 'Lainya',
              backgroundColor: Color.fromARGB(255, 20, 139, 114)),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        currentIndex: 1,
        onTap: (int i) {
          switch (i) {
            case 0:
              Get.offAllNamed(Routes.HOMEKEPALABALAI);
              break;
            case 1:
              break;
            case 2:
              Get.offAllNamed(Routes.STATISTIK);
              break;
            case 3:
              Get.offAllNamed(Routes.KONTAKKEPALABALAI);
              break;
            case 4:
              Get.toNamed(Routes.MOREKEPALABALAI);

              break;
          }
        },
      ),
    );
  }
}
