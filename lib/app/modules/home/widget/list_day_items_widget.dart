import 'package:bpkh_xi_yogyakarta/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../models/info_alat.dart';

class DayItemsWidget extends StatelessWidget {
  const DayItemsWidget({Key? key, required this.data}) : super(key: key);
  final List<Datum> data;

  @override
  Widget build(BuildContext context) {
    // final data1 = data;
    return SizedBox(
        height: 230,
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(Routes.DETAILALAT, arguments: [
                  data[index].gambar,
                  data[index].nama,
                  data[index].status,
                  data[index].inventaris,
                  data[index].merk,
                  data[index].kategori,
                  data[index].keterangan,
                  data[index].kondisi,
                ]);
              },
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.75,
                        blurRadius: 2,
                        offset:
                            const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(5),
                height: 15,
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      height: 70,
                      decoration: data[index].gambar!.isNotEmpty
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.5)),
                              image: DecorationImage(
                                  image: NetworkImage(data[index].gambar!)))
                          : BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.5)),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/image_not_found.png"))),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: Text(data[index].nama!,
                                      style: GoogleFonts.openSans(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(data[index].inventaris!,
                                    style: GoogleFonts.openSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(data[index].merk!,
                                    style: GoogleFonts.openSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Keterangan: ",
                                  style: GoogleFonts.openSans(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  )),
                              Container(
                                child: Text(data[index].keterangan!),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (data[index].status == true)
                          Container(
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
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
                        if (data[index].status == false)
                          Container(
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.red.withOpacity(0.7)),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.bookmark_added_outlined,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                Text("dipinjam")
                              ],
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          scrollDirection: Axis.horizontal,
        ));
  }
}
