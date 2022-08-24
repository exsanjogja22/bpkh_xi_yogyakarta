import 'package:bpkh_xi_yogyakarta/app/modules/home/widget/loading_widget2.dart';
import 'package:bpkh_xi_yogyakarta/app/routes/app_pages.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../widget/list_day_items_widget.dart';
import '../widget/list_items_widget.dart';
import '../widget/loading_widget.dart';
import '../widget/search.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/home_controller.dart';
import '../models/info_alat.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/4.png'),
          ),
          backgroundColor: Color.fromARGB(255, 20, 139, 134),
          title: SizedBox(
            width: 200,
            height: 30,
            child: Text('SIMONAKUR\nSistem Monotoring Alat Ukur',
                maxLines: 2,
                style: GoogleFonts.openSans(color: Colors.white, fontSize: 12)),
          ),
          titleTextStyle:
              GoogleFonts.openSans(color: Colors.black, fontSize: 12),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              icon: const Icon(Icons.search),
              color: Colors.white,
              iconSize: 25,
            )
          ],
        ),
        body: Obx(
          () => SmartRefresher(
            controller: controller.onRefres,
            onRefresh: controller.toRefres,
            enablePullUp: true,
            onLoading: controller.toLoading,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 170,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(255, 20, 139, 134),
                              Color.fromARGB(255, 20, 139, 124),
                              Color.fromARGB(255, 20, 144, 117),
                              Color.fromARGB(255, 20, 139, 114),
                            ],
                            stops: [0.1, 0.4, 0.7, 0.9],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: MediaQuery.of(context).padding.top,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          height: 140,
                          width: MediaQuery.of(context).size.width,
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
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Flexible(
                                flex: 9,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: 10, left: 10, right: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Total jumlah barang",
                                            style: GoogleFonts.openSans(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            "Unit",
                                            style: GoogleFonts.openSans(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Jumlah",
                                              style: GoogleFonts.openSans(
                                                  color: Colors.black,
                                                  fontSize: 12)),
                                          StreamBuilder<List<Datum>>(
                                              stream:
                                                  controller.infoAlat2(1000),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  final infoAlat =
                                                      snapshot.data!;
                                                  return Text(
                                                    infoAlat.length.toString(),
                                                    style: GoogleFonts.openSans(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12),
                                                  );
                                                } else {
                                                  return Text(
                                                    "0  ",
                                                    style: GoogleFonts.openSans(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12),
                                                  );
                                                }
                                              })
                                        ],
                                      ),
                                      const Divider(color: Colors.grey),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                  flex: 10,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 10, right: 10, bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Flexible(
                                            flex: 2,
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  Text("Barang Yang Dipinjam",
                                                      style:
                                                          GoogleFonts.openSans(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 12)),
                                                  Text("4 Unit",
                                                      style:
                                                          GoogleFonts.openSans(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12)),
                                                ],
                                              ),
                                            )),
                                        const VerticalDivider(
                                          color: Colors.grey,
                                        ),
                                        Flexible(
                                            flex: 2,
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  Text("Barang Yang Tersedia",
                                                      style:
                                                          GoogleFonts.openSans(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 12)),
                                                  Text("26 Unit",
                                                      style:
                                                          GoogleFonts.openSans(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12)),
                                                ],
                                              ),
                                            ))
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Daftar Barang yang Tersedia Hari ini',
                            style: GoogleFonts.openSans(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 20, 139, 114))),
                      ],
                    ),
                  ),
                  StreamBuilder<InfoAlat>(
                      stream: controller.infoAlat(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return LoadingWidget();
                        } else {
                          if (snapshot.hasData) {
                            final infoAlat = snapshot.data!.data;
                            return Column(
                              children: [
                                DayItemsWidget(
                                  data: infoAlat,
                                ),
                              ],
                            );
                          } else {
                            return LoadingWidget();
                          }
                        }
                      }),
                  Container(
                    margin: const EdgeInsets.only(left: 30, right: 30, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Daftar Semua Barang',
                            style: GoogleFonts.openSans(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 20, 139, 114))),
                      ],
                    ),
                  ),
                  StreamBuilder<List<Datum>>(
                      stream: controller.infoAlat2(controller.limit.value),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final infoAlat = snapshot.data!;
                          return ListItemsWidget(
                            data: infoAlat,
                          );
                        } else {
                          return LoadingWidget2();
                        }
                      })
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.fixedCircle,
          backgroundColor: Colors.white,
          color: Colors.grey[400],
          activeColor: Color.fromARGB(255, 20, 139, 114),
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.info_outline, title: 'Peminjam'),
            TabItem(icon: Icons.add, title: 'add'),
            TabItem(icon: Icons.call, title: 'Kontak'),
            TabItem(icon: Icons.more_vert_sharp, title: 'More'),
          ],
          initialActiveIndex: 0, //optional, default as 0
          onTap: (int i) {
            switch (i) {
              case 0:
                break;
              case 1:
                Get.offAllNamed(Routes.INFOPEMINJAM);
                break;
              case 2:
                Get.toNamed(Routes.PEMINJAMAN);
                break;
              case 3:
                Get.offAllNamed(Routes.KONTAK);
                break;
              case 4:
                Get.toNamed(Routes.MORE);
                break;
            }
          },
        ));
  }
}
