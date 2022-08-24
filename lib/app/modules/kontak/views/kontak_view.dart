import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../routes/app_pages.dart';
import '../../home/widget/search.dart';
import '../controllers/kontak_controller.dart';

class KontakView extends GetView<KontakController> {
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
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.fixedCircle,
          backgroundColor: Color.fromARGB(255, 20, 139, 114),
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.info_outline, title: 'Peminjam'),
            TabItem(icon: Icons.add, title: 'add'),
            TabItem(icon: Icons.call, title: 'Kontak'),
            TabItem(icon: Icons.more_vert_sharp, title: 'More'),
          ],
          initialActiveIndex: 3, //optional, default as 0
          onTap: (int i) {
            switch (i) {
              case 0:
                Get.offAllNamed(Routes.HOME);
                break;
              case 1:
                Get.offAllNamed(Routes.INFOPEMINJAM);
                break;
              case 3:
                break;
              case 4:
                Get.toNamed(Routes.MORE);
                break;
            }
          },
        ));
  }
}
