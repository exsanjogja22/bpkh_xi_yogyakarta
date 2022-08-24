import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../routes/app_pages.dart';
import '../../home/widget/search.dart';
import '../controllers/kontakkepalabalai_controller.dart';

class KontakkepalabalaiView extends GetView<KontakkepalabalaiController> {
  @override
  Widget build(BuildContext context) {
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
          child: Text('Peminjaman Alat Online BPKH XI YOGJAKARTA',
              maxLines: 2, style: GoogleFonts.openSans(fontSize: 12)),
        ),
        titleTextStyle: GoogleFonts.openSans(color: Colors.black),
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
      body: SingleChildScrollView(
          child: Column(
        children: [
          ListTile(
            onTap: () => launchUrlString("tel://0274388923"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 10,
            ),
            title: Text("Hubungi Admin"),
            leading: Icon(Icons.call,
                color: const Color.fromARGB(255, 20, 139, 114)),
          ),
          ListTile(
            onTap: () {
              controller.launchURLWa();
            },
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 10,
            ),
            title: Text("help ?"),
            leading: Icon(Icons.info_rounded,
                color: const Color.fromARGB(255, 20, 139, 114)),
          ),
        ],
      )),
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
        currentIndex: 3,
        onTap: (int i) {
          switch (i) {
            case 0:
              Get.offAllNamed(Routes.HOMEKEPALABALAI);
              break;
            case 1:
              Get.offAllNamed(Routes.APROVALBARANG);
              break;
            case 2:
              Get.offAllNamed(Routes.STATISTIK);
              break;
            case 3:
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
