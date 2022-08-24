import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/detailalat_controller.dart';

class DetailalatView extends GetView<DetailalatController> {
  final data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/like-svgrepo-com.svg',
                width: 20,
                height: 20,
              ))
        ],
      ),
      body: Column(children: [
        Image.network(
          data[0],
          height: MediaQuery.of(context).size.height * 0.4,
          fit: BoxFit.cover,
        ),
        Expanded(
            child: Container(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      data[1],
                      style: GoogleFonts.roboto(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (data[2] == true)
                    Container(
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          color: const Color.fromARGB(255, 76, 175, 117)
                              .withOpacity(0.7)),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.bookmark_added_outlined,
                            size: 20,
                            color: Colors.black,
                          ),
                          Text("Tersedia")
                        ],
                      ),
                    ),
                  if (data[2] == false)
                    Container(
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          color: Colors.red.withOpacity(0.7)),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.bookmark_added_outlined,
                            size: 20,
                            color: Colors.black,
                          ),
                          Text("Dipinjam")
                        ],
                      ),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text("Inventaris : ${data[3]}",
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Merk : ${data[4]}",
                        style: GoogleFonts.roboto(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Ktegori barang : ${data[5]}",
                        style: GoogleFonts.roboto(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green.withOpacity(0.2),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Keterangan :",
                          style:
                              GoogleFonts.roboto(fontWeight: FontWeight.bold),
                        )),
                      ],
                    ),
                    Text(
                        "Barang Dengan Kondisi ${data[6]} barang masih ${data[7]} untuk melakukan peminjaman",
                        style: GoogleFonts.roboto()),
                  ],
                ),
              ),
            ],
          ),
        )),
      ]),
    );
  }
}
