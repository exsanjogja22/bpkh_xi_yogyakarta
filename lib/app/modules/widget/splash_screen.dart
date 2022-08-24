import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SpalshScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 70,
                          width: 70,
                          child: Image.asset("assets/images/4.png")),
                      Image.asset("assets/images/3.png"),
                    ],
                  ),
                ),
              ),
              Stack(
                children: [
                  Image.asset("assets/images/5.png"),
                  Positioned(
                    top: 70,
                    left: 0,
                    right: 0,
                    child: Text(
                      "Aplikasi for Android v1.0.2 arm64-v8a \n2022",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        )
            // Scaffold(
            //     body: Stack(children: [
            //   Container(
            //     height: MediaQuery.of(context).size.height,
            //     width: MediaQuery.of(context).size.width,
            //     decoration: const BoxDecoration(
            //         // gradient: LinearGradient(
            //         //   begin: Alignment.topCenter,
            //         //   end: Alignment.bottomCenter,
            //         //   colors: [
            //         //     Color.fromARGB(255, 20, 139, 134),
            //         //     Color.fromARGB(255, 20, 139, 124),
            //         //     Color.fromARGB(255, 20, 144, 117),
            //         //     Color.fromARGB(255, 20, 139, 114),
            //         //   ],
            //         //   stops: [0.1, 0.4, 0.7, 0.9],
            //         // ),
            //         ),
            //   ),
            //   Center(
            //     child: Container(
            //       child: Column(
            //         mainAxisSize: MainAxisSize.min,
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           SizedBox(
            //               height: 80,
            //               width: 80,
            //               child: Image.asset("assets/images/4.png")),
            //           SizedBox(
            //               height: 150,
            //               width: 150,
            //               child: Image.asset("assets/images/3.png")),
            //         ],
            //       ),
            //     ),
            //   )
            // ]))
            ));
  }
}
