import 'package:bpkh_xi_yogyakarta/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/peminjaman_controller.dart';
import '../models/transaksi_id.dart';

class PeminjamanView extends GetView<PeminjamanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            'Biodata',
           
          ),
        ),
        titleTextStyle: GoogleFonts.roboto(color: Colors.black,
        fontSize: 18
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.help),
            color: Colors.black,
            iconSize: 25,
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Row(
            children: [
              Expanded(child: Text("No. Transaksi")),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey[300]),
            child: Row(
              children: [
                Expanded(
                    child: FutureBuilder<Transaksi?>(
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
                        })),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(child: Text("Nama")),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              alignment: Alignment.centerLeft,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[300]),
              child: TextField(
                  controller: controller.nama,
                  keyboardType: TextInputType.name,
                  style: const TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10),
                      helperStyle: GoogleFonts.roboto(
                          color: Colors.black38, fontSize: 12)))),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(child: Text("NIP")),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              alignment: Alignment.centerLeft,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey)),
              child: TextField(
                  controller: controller.nip,
                  keyboardType: TextInputType.name,
                  style: const TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                      hintText: "Masukan NIP",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10),
                      helperStyle: GoogleFonts.roboto(
                          color: Colors.black38, fontSize: 12)))),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(child: Text("Nomor WA (Format +62)")),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              alignment: Alignment.centerLeft,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey)),
              child: TextField(
                  controller: controller.noWa,
                  keyboardType: TextInputType.name,
                  style: const TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                      hintText: "Masukan No WA",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10),
                      helperStyle: GoogleFonts.roboto(
                          color: Colors.black38, fontSize: 12)))),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(child: Text("Dasar Peminjaman")),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey)),
              child: TextField(
                  maxLines: 7,
                  controller: controller.alasan,
                  keyboardType: TextInputType.name,
                  style: const TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                      hintText:
                          "Masukan nomor surat tugas, tanggal, dan judul kegiatan tugas",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all( 10),
                      helperStyle: GoogleFonts.roboto(
                          color: Colors.black38, fontSize: 12)))),
            SizedBox(
            height: 10,
          ),
          SizedBox(
              width: double.infinity,
              child:  ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 20, 139, 114)
                ),
                  onPressed: () {
                    Get.toNamed(Routes.FORMSTRANSAKSI);
                  },
                  child: Text("Selanjutnya ->")))
        ]),
      )),
    );
  }
}
