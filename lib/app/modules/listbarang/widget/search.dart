import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/listbarang_controller.dart';

class DataSearchPeminjaman extends SearchDelegate<String> {
  final ListbarangController peminjamanC = Get.put(ListbarangController());

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
        ? peminjamanC.listSearch
        : peminjamanC.listbarang
            .where((c) => c.nama!.toLowerCase().startsWith(query))
            .toList();
    return peminjamanC.listbarang
            .where((c) => c.nama!.toLowerCase().startsWith(query))
            .toList()
            .isNotEmpty
        ? ListView.builder(
            itemCount: responseList.length,
            itemBuilder: ((context, index) => Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 5),
                  width: MediaQuery.of(context).size.width,
                  height: 80,
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
                            image: NetworkImage(responseList[index].gambar!))
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
                                    style: GoogleFonts.roboto(
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
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w400,
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child:
                                      Text(responseList[index].merk!,
                                          style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w400,
                                          )),
                                ),
                              ],
                            )
                          ]),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
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
                                Text("Redy")
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  peminjamanC.addAlat(
                                      responseList[index].id!,
                                      responseList[index].inventaris!,
                                      responseList[index].nama!);
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.5)),
                                  ),
                                  child: const Icon(Icons.add,
                                      color: Color.fromARGB(255, 76, 175, 117)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
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
                  Text('Tidak ada hasi yang di temukan.',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold
                  ),
                  ),
              ],
            ),
          );
  }
}
