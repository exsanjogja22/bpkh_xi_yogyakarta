import 'package:bpkh_xi_yogyakarta/app/modules/home/controllers/home_controller.dart';
import 'package:bpkh_xi_yogyakarta/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../home/models/info_alat.dart';
import '../../home/widget/list_day_items_widget.dart';
import '../../home/widget/list_items_widget.dart';
import '../../home/widget/loading_widget.dart';
import '../../home/widget/loading_widget2.dart';
import '../../home/widget/search.dart';
import '../controllers/homekepalabalai_controller.dart';

class HomekepalabalaiView extends GetView<HomekepalabalaiController> {
  @override
  Widget build(BuildContext context) {
    final homeC = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/logo.png'),
        ),
        backgroundColor: Colors.white,
        title: SizedBox(
          width: 200,
          height: 30,
          child: Text('Peminjaman Alat Online\nBPKH XI YOGJAKARTA',
              maxLines: 2, style: GoogleFonts.openSans(fontSize: 12)),
        ),
        titleTextStyle: GoogleFonts.openSans(color: Colors.black, fontSize: 12),
        actions: [
          IconButton(
            onPressed: () async {
              SharedPreferences delToken =
                  await SharedPreferences.getInstance();
              await delToken.clear();
              Get.offAllNamed(Routes.USERLEVEL);
            },
            icon: const Icon(
              Icons.logout,
              size: 20,
            ),
            color: Colors.black,
            iconSize: 25,
          ),
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
            icon: const Icon(Icons.search),
            color: Colors.black,
            iconSize: 25,
          )
        ],
      ),
      body: Obx(
        () => SmartRefresher(
          controller: homeC.onRefres,
          onRefresh: homeC.toRefres,
          enablePullUp: true,
          onLoading: homeC.toLoading,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Daftar Barang Sedang di Pinjam Hari Ini',
                          style: GoogleFonts.openSans(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 20, 139, 114))),
                    ],
                  ),
                ),
                StreamBuilder<InfoAlat>(
                    stream: homeC.infoAlat(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return LoadingWidget();
                      } else {
                        if (snapshot.hasData) {
                          final infoAlat = snapshot.data!.data;
                          return DayItemsWidget(
                            data: infoAlat!,
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
                    stream: homeC.infoAlat2(homeC.limit.value),
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
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
              backgroundColor: Color.fromARGB(255, 20, 139, 114)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list_sharp,
                size: 18,
              ),
              label: 'Konfirmasi',
              backgroundColor: Color.fromARGB(255, 20, 139, 114)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.trending_up_rounded,
                size: 18,
              ),
              label: 'Statistik',
              backgroundColor: Color.fromARGB(255, 20, 139, 114)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.call,
                size: 18,
              ),
              label: 'Kontak',
              backgroundColor: Color.fromARGB(255, 20, 139, 114)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.more_vert_sharp,
                size: 18,
              ),
              label: 'Lainya',
              backgroundColor: Color.fromARGB(255, 20, 139, 114)),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        currentIndex: 0,
        onTap: (int i) {
          switch (i) {
            case 0:
              break;
            case 1:
              Get.offAllNamed(Routes.APROVALBARANG);
              break;
            case 2:
              Get.offAllNamed(Routes.STATISTIK);
              break;
            case 3:
              Get.offAllNamed(Routes.KONTAKKEPALABALAI);
              break;
            case 4:
              Get.toNamed(Routes.MOREKEPALABALAI);
              break;
          }
        },
      ),
    );
  }

  List<Widget> buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < controller.numPages.value; i++) {
      list.add(i == controller.currentPage.value
          ? _indicator(true)
          : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 3.0,
      width: isActive ? 18.0 : 10.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.grey : const Color.fromARGB(255, 24, 144, 155),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
