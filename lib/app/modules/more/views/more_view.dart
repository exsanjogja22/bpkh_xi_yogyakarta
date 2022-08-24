import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/more_controller.dart';

class MoreView extends GetView<MoreController> {
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
          title: Text(
            'More',
          ),
          titleTextStyle:
              GoogleFonts.openSans(color: Colors.black, fontSize: 18),
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
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
            Column(children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Center(
                    child: Text(
                  "BPKH XI Wilayah Yogyakarta",
                  style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
              ),
              Image.asset("assets/images/logo.png", height: 100, width: 100),
              Container(
                  padding: EdgeInsets.all(20),
                  child: Center(
                      child: Text(
                    "Jl. Ngeksigondo No.58, Prenggan, Kec. Kotagede, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55172",
                    style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        controller.launchURLfacebook();
                      },
                      icon: Image.asset("assets/images/facebook.png")),
                  IconButton(
                      onPressed: () {
                        controller.launchURLTwiter();
                      },
                      icon: Image.asset("assets/images/twitter.png")),
                  IconButton(
                      onPressed: () {
                        controller.launchURLIg();
                      },
                      icon: Image.asset("assets/images/instagram.png")),
                  IconButton(
                      onPressed: () {
                        controller.launchURLYt();
                      },
                      icon: Image.asset("assets/images/youtube.png")),
                ],
              ),
              SizedBox(height: 200),
              Container(
                padding: EdgeInsets.all(20),
                child: Center(
                    child: Text(
                  "Aplikasi for Android v1.0.2 arm64-v8a \n2022 ",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                      fontSize: 12, color: Colors.grey[200]),
                )),
              )
            ]),
          ],
        ));
  }
}
