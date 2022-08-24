import 'package:bpkh_xi_yogyakarta/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/userlevel_controller.dart';

class UserlevelView extends GetView<UserlevelController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 20, 139, 134).withOpacity(0.5)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(child: Image.asset("assets/images/580558.png")),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Text(
                    'Aplikasi Peminjaman Alat',
                    style: GoogleFonts.openSans(
                      color: Color.fromARGB(255, 20, 139, 114),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Text(
                    'BPKH XI Yogyakarta',
                    style: GoogleFonts.openSans(
                      color: Color.fromARGB(255, 20, 139, 114),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 20, 139, 114),
                      elevation: 5.0,
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.HOME);
                    },
                    child: Text(
                      "Peminjam",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ))),
            Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      elevation: 5.0,
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.LOGINKEPALABALAI);
                    },
                    child: Text(
                      "Kepala Balai",
                      style: TextStyle(
                        color: Color.fromARGB(255, 20, 139, 114),
                        letterSpacing: 1.5,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ))),
            TextButton(
                onPressed: () {},
                child: const Text('Help !',
                    style: TextStyle(fontSize: 12, color: Colors.white)))
          ],
        )
      ]),
    );
  }
}
