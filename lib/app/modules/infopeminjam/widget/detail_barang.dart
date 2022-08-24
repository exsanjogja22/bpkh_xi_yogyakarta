import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../controllers/infopeminjam_controller.dart';
import '../models/detail_transaksi.dart';

class DetailBarang extends StatelessWidget {
  DetailBarang({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    final InfopeminjamController infoC = Get.put(InfopeminjamController());
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      height: MediaQuery.of(context).size.height - 200,
      child: StreamBuilder<DetailTransaksi>(
          stream: infoC.detailTransaksi(id.toString()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasData) {
                final data = snapshot.data!.data;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height: 5,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            "Deskripsi :",
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 20, 139, 114),
                                fontSize: 14),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.key_outlined,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Text("Id Transaksi :",
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12))),
                          Text(data.transaksi),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Text("Nama Peminjam :",
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12))),
                          Text(data.namapeminjam,
                              style: GoogleFonts.openSans(fontSize: 12)),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.class_rounded,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Text("NIP :",
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12))),
                          Text(data.nip,
                              style: GoogleFonts.openSans(fontSize: 12)),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.call,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Text("No Wa :",
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12))),
                          Text(data.noWa,
                              style: GoogleFonts.openSans(fontSize: 12)),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.date_range,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Text("Tanggal Pinjam :",
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12))),
                          Text(
                              " ${DateFormat("d-MM-yyyy", "id_ID").format(data.tglpinjam).toString()}",
                              style: GoogleFonts.openSans(fontSize: 12)),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.date_range,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Text("Tanggal Kembali :",
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12))),
                          Text(
                              " ${DateFormat("d-MM-yyyy ", "id_ID").format(data.tglkembali).toString()}",
                              style: GoogleFonts.openSans(fontSize: 12)),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            "Daftar Barang :",
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 20, 139, 114),
                                fontSize: 14),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
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
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  tooltip: 'represents if user is verified.'),
                              DataColumn(
                                  label: Text(
                                    'Nama',
                                    style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  tooltip: 'represents if user is verified.'),
                              DataColumn(
                                  label: Text(
                                    'Merek Type',
                                    style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  tooltip: 'represents if user is verified.'),
                            ],
                            rows: data.daftarBarang
                                .map((cell) => DataRow(cells: [
                                      DataCell(
                                        Text(cell.inventaris,
                                            style: GoogleFonts.openSans(
                                                fontSize: 12)),
                                      ),
                                      DataCell(
                                        Text(cell.nama,
                                            style: GoogleFonts.openSans(
                                                fontSize: 12)),
                                      ),
                                      DataCell(
                                        Text(cell.kategori,
                                            style: GoogleFonts.openSans(
                                                fontSize: 12)),
                                      ),
                                    ]))
                                .toList(),
                          )))
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
          }),
    );
  }
}
