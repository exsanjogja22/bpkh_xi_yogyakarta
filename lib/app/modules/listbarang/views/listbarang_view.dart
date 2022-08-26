import 'package:bpkh_xi_yogyakarta/app/modules/listbarang/widget/search.dart';
import 'package:bpkh_xi_yogyakarta/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../home/models/info_alat.dart';
import '../../home/widget/loading_widget2.dart';
import '../controllers/listbarang_controller.dart';
import '../models/menu_items.dart';
import '../widget/menu_items_widget.dart';

class ListbarangView extends GetView<ListbarangController> {
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
              'Stok Barang',
            ),
          ),
          titleTextStyle:
              GoogleFonts.openSans(color: Colors.black, fontSize: 18),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: DataSearchPeminjaman());
              },
              icon: const Icon(Icons.search),
              color: Colors.black,
              iconSize: 25,
            ),
            PopupMenuButton<MenuItems>(
                icon: Icon(
                  Icons.filter_list,
                  color: Colors.black,
                ),
                onSelected: (item) => onSelected(
                      context,
                      item,
                    ),
                itemBuilder: (context) =>
                    [...MenuItemsWidget.listItemsMenu.map(buildItems).toList()])
          ],
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(left: 35),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.DETAILPENGAJUAN);
              },
              child: Text("Selanjutnya ->"),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 20, 139, 114)),
            ),
          ),
        ),
        body: Obx(
          () => StreamBuilder<InfoAlat?>(
              stream: controller.infoAlat2(
                  controller.limit.value, controller.kategori.value),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final infoAlat = snapshot.data!.data;
                  return Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    child: SmartRefresher(
                      controller: controller.onRefres,
                      onRefresh: controller.toRefres,
                      enablePullUp: true,
                      onLoading: controller.toLoading,
                      child: ListView.builder(
                        itemCount: infoAlat!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {},
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(5),
                                        height: 90,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          image: infoAlat[index].gambar != ""
                                              ? DecorationImage(
                                                  image: NetworkImage(
                                                      infoAlat[index].gambar!))
                                              : DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/image_not_found.png")),
                                          border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(0.5)),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          color: Colors.white,
                                          child: Column(children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    infoAlat[index].nama!,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.roboto(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                      infoAlat[index]
                                                          .inventaris!,
                                                      style: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      )),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                      infoAlat[index].merk!,
                                                      style: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      )),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("Keterangan :",
                                                    style: GoogleFonts.roboto(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                                Container(
                                                  color: Colors.amber,
                                                  child: Text(infoAlat[index]
                                                      .keterangan!),
                                                )
                                              ],
                                            )
                                          ]),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          if (infoAlat[index].status == true)
                                            Container(
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10)),
                                                  color: const Color.fromARGB(
                                                          255, 76, 175, 117)
                                                      .withOpacity(0.7)),
                                              child: Row(
                                                children: const [
                                                  Icon(
                                                    Icons
                                                        .bookmark_added_outlined,
                                                    size: 20,
                                                    color: Colors.black,
                                                  ),
                                                  Text("Tersedia")
                                                ],
                                              ),
                                            ),
                                          if (infoAlat[index].status == false)
                                            Container(
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10)),
                                                  color: Colors.red
                                                      .withOpacity(0.7)),
                                              child: Row(
                                                children: const [
                                                  Icon(
                                                    Icons
                                                        .bookmark_added_outlined,
                                                    size: 20,
                                                    color: Colors.black,
                                                  ),
                                                  Text("Dipinjam")
                                                ],
                                              ),
                                            ),
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  controller.addAlat(
                                                      infoAlat[index].id!,
                                                      infoAlat[index]
                                                          .inventaris!,
                                                      infoAlat[index].nama!);
                                                },
                                                child: Container(
                                                  margin:
                                                      const EdgeInsets.all(5),
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: Colors.grey
                                                            .withOpacity(0.5)),
                                                  ),
                                                  child: const Icon(Icons.add,
                                                      color: Color.fromARGB(
                                                          255, 76, 175, 117)),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ]),
                              ));
                        },
                      ),
                    ),
                  );
                } else {
                  return LoadingWidget2();
                }
              }),
        ));
  }

  PopupMenuItem<MenuItems> buildItems(MenuItems item) =>
      PopupMenuItem(value: item, child: Text(item.selection));
  void onSelected(BuildContext context, MenuItems item) {
    controller.kategori.value = item.id;
  }
}
