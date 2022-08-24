import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../routes/app_pages.dart';
import '../../home/widget/search.dart';
import '../controllers/statistik_controller.dart';

class StatistikView extends GetView<StatistikController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/logo.png'),
        ),
        backgroundColor: Colors.white,
        title: const SizedBox(
          width: 200,
          height: 30,
          child: Text(
            'Peminjaman Alat Online\nBPKH XI YOGJAKARTA',
            maxLines: 2,
          ),
        ),
        titleTextStyle: GoogleFonts.openSans(color: Colors.black, fontSize: 12),
        actions: [
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
      body: FutureBuilder<String?>(
          future: controller.gettoken(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1.75,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 5.0,
                          ))));
            } else {
              if (snapshot.hasData) {
                return WebView(
                  initialUrl:
                      "https://pinjamalat.bpkh11jogja.net/api/pengawas/statistik?Authorization=${snapshot.data}",
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {
                    controller.controller.complete(webViewController);
                  },
                  onProgress: (int progress) {
                    // ignore: avoid_print
                    print('WebView is loading (progress : $progress%)');
                  },
                );
              }
            }
            return Center(
                child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1.75,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 5.0,
                        ))));
          }),
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
        currentIndex: 2,
        onTap: (int i) {
          switch (i) {
            case 0:
              Get.offAllNamed(Routes.HOMEKEPALABALAI);
              break;
            case 1:
              Get.offAllNamed(Routes.APROVALBARANG);
              break;
            case 2:
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
}
