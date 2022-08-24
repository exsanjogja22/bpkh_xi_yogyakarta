import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../models/info_alat.dart';

class ListItemsWidget extends StatelessWidget {
  const ListItemsWidget({Key? key, required this.data}) : super(key: key);
  final List<Datum> data;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
            margin:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
            width: MediaQuery.of(context).size.width,
            height: 100,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.75,
                blurRadius: 2,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ], borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  height: 90,
                  width: 100,
                  decoration: data[index].gambar.isNotEmpty
                      ? BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(data[index].gambar)),
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        )
                      : BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/image_not_found.png")),
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    color: Colors.white,
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              data[index].nama,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.openSans(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(data[index].inventaris,
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
                            child: Text(data[index].merk,
                                style: GoogleFonts.openSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Keterangan :",
                              style: GoogleFonts.openSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              )),
                          Container(
                            color: Colors.amber,
                            child: Text(data[index].keterangan),
                          )
                        ],
                      ),
                    ]),
                  ),
                ),
                Column(
                  children: [
                    if (data[index].status == true)
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
                    SizedBox(height: 30),
                    if (data[index].status == false)
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
                )
              ],
            ),
          ),
        );
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
