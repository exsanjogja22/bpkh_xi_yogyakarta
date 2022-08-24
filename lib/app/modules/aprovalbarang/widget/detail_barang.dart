import 'package:bpkh_xi_yogyakarta/app/modules/aprovalbarang/models/detail_aproval_models.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../controllers/aprovalbarang_controller.dart';

class DetailBarangAproval extends StatelessWidget {
  DetailBarangAproval({Key? key, required this.id, required this.controller})
      : super(key: key);
  final String id;
  final AprovalbarangController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      height: MediaQuery.of(context).size.height - 200,
      child: StreamBuilder<DetailAproval?>(
          stream: controller.detailaproval(id.toString()),
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
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            "Deskripsi :",
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 20, 139, 114),
                                fontSize: 18),
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
                                  ))),
                          Text(data!.transaksi!),
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
                                  ))),
                          Text(data.namapeminjam!),
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
                                  ))),
                          Text(data.nip!),
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
                                  ))),
                          Text(data.noWa!),
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
                                  ))),
                          Text(
                              " ${DateFormat("d-MM-yyyy", "id_ID").format(data.tglpinjam!).toString()}"),
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
                                  ))),
                          Text(
                              " ${DateFormat("d-MM-yyyy ", "id_ID").format(data.tglkembali!).toString()}"),
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
                                fontSize: 18),
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
                                    'Merek Type',
                                    style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  tooltip: 'represents if user is verified.'),
                            ],
                            rows: data.barang!
                                .map((cell) => DataRow(cells: [
                                      DataCell(
                                        Text(cell.inventaris!),
                                      ),
                                      DataCell(
                                        Text(cell.nama!),
                                      ),
                                      DataCell(
                                        Text(cell.kategori!),
                                      ),
                                    ]))
                                .toList(),
                          ))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                controller.kofirmasi(
                                    data.id.toString(), false, context);
                              },
                              child: Text("Tolak"),
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.red),
                            ),
                          ),
                          Container(
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                controller
                                    .tokenPeminjam(data.transaksi.toString());
                                controller.kofirmasi(
                                    data.id.toString(), true, context);
                              },
                              child: Text("Konfirmasi"),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Text("data Kosong"),
                );
              }
            }
          }),
    );
  }
}
