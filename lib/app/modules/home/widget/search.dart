import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class DataSearch extends SearchDelegate<String> {
  final HomeController homeC = Get.put(HomeController());

  @override
  List<Widget>? buildActions(BuildContext context) {
    // action for app bar
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result base on the selection
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final responseList = query.isEmpty
        ? homeC.listSearch
        : homeC.list
            .where((c) => c.nama!.toLowerCase().startsWith(query))
            .toList();
    return homeC.list
            .where((c) => c.nama!.toLowerCase().startsWith(query))
            .toList()
            .isNotEmpty
        ? ListView.builder(
            itemCount: responseList.length,
            itemBuilder: ((context, index) => GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.DETAILALAT, arguments: [
                      responseList[index].gambar,
                      responseList[index].nama,
                      responseList[index].status,
                      responseList[index].inventaris,
                      responseList[index].merk,
                      responseList[index].kategori,
                      responseList[index].keterangan,
                      responseList[index].kondisi,
                    ]);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 5),
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.75,
                            blurRadius: 2,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          height: 80,
                          width: 100,
                          decoration: BoxDecoration(
                            image: responseList[index].gambar != ""
                                ? DecorationImage(
                                    image: NetworkImage(
                                        responseList[index].gambar!))
                                : DecorationImage(
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
                                      responseList[index].nama!,
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
                                    child: Text(responseList[index].inventaris!,
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
                                    child: Text(responseList[index].merk!,
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
                                    child:
                                        Text(responseList[index].keterangan!),
                                  )
                                ],
                              ),
                            ]),
                          ),
                        ),
                        Column(
                          children: [
                            if (responseList[index].status == true)
                              Container(
                                width: 76,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                    color:
                                        const Color.fromARGB(255, 76, 175, 117)
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
                            if (responseList[index].status == false)
                              Container(
                                width: 76,
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
                )))
        : SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search),
                SizedBox(height: 10),
                Text(
                  'Tidak ada hasi yang di temukan.',
                  style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
  }
}
