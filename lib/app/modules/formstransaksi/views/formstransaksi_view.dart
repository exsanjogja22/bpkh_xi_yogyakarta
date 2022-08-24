import 'package:bpkh_xi_yogyakarta/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../peminjaman/models/transaksi_id.dart';
import '../controllers/formstransaksi_controller.dart';

class FormstransaksiView extends GetView<FormstransaksiController> {
 
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
            'Pengajuan Tanggal',
           
          ),
        ),
        titleTextStyle: GoogleFonts.openSans(color: Colors.black,
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
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 35),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.LISTBARANG);
            },
            child: Text("Selanjutnya ->"),
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 20, 139, 114)),
          ),
        ),
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
              Expanded(child: Text("Tgl Pinjam")),
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
                  controller: controller.tglmeminjam,
                 onTap: (){
                   controller.showDatePickerNowTglPinjam(context);
                 },
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
              Expanded(child: Text("Tgl Kembali")),
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
                onTap: () {
                  controller.showDatePickerNowTglKembali(context);
                },
                  controller: controller.tglkembali,
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
              Expanded(child: Text("Tanggal Mulai Tugas")),
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
                onTap: (){
                  controller.showDatePickerNowTglMulaiTugas(context);
                },
                controller: controller.tgMulaiTugas,
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
              Expanded(child: Text("Tanggal Selesai Tugas ")),
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
                onTap: (){
                  controller.showDatePickerNowTglSelesaiTugas(context);
                },
                controller: controller.tgSelesaiTugas,
                  keyboardType: TextInputType.name,
                  style: const TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10),
                      helperStyle: GoogleFonts.roboto(
                          color: Colors.black38, fontSize: 12)))),
        ]),
      )),
    );
  }
}
