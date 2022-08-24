import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/newpassword_controller.dart';

class NewpasswordView extends GetView<NewpasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 20, 139, 134),
        title: Text(
          'Password ',
          style: GoogleFonts.openSans(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        leading: Container(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: Colors.black,
            child: CircleAvatar(
              radius: 18,
              backgroundColor: const Color.fromARGB(255, 20, 139, 134),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: Colors.white,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color.fromARGB(255, 20, 139, 134),
                const Color.fromARGB(255, 20, 139, 124),
                const Color.fromARGB(255, 20, 144, 117),
                const Color.fromARGB(255, 20, 139, 114),
              ],
              stops: [0.1, 0.4, 0.7, 0.9],
            ),
          ),
        ),
        Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 70,
                    ),
                    Text(
                      'Masukan Password minimal 6 digit',
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(height: 70.0),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Password',
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 20, 139, 114),
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6.0,
                                  offset: Offset(0, 2),
                                ),
                              ]),
                          height: 50.0,
                          child: TextField(
                            obscureText: controller.isObscure.value,
                            controller: controller.newpassword,
                            keyboardType: TextInputType.visiblePassword,
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14.0),
                              prefixIcon: Icon(
                                Icons.lock,
                                size: 20,
                                color: Colors.white,
                              ),
                              suffixIcon: IconButton(
                                  icon: controller.isObscure.value
                                      ? Icon(Icons.visibility_off,
                                          size: 20, color: Colors.grey)
                                      : Icon(
                                          Icons.visibility,
                                          size: 20,
                                          color: Color(0xff08B197),
                                        ),
                                  onPressed: () {
                                    controller.isObscure.value =
                                        !controller.isObscure.value;
                                  }),
                              hintText: 'Masukan password ',
                              hintStyle: GoogleFonts.openSans(
                                color: Colors.grey[400],
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Konfirmasi Password',
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 20, 139, 114),
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6.0,
                                  offset: Offset(0, 2),
                                ),
                              ]),
                          height: 50.0,
                          child: TextField(
                            obscureText: controller.isObscure.value,
                            controller: controller.confrimpassword,
                            keyboardType: TextInputType.visiblePassword,
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14.0),
                              prefixIcon: Icon(
                                Icons.lock,
                                size: 20,
                                color: Colors.white,
                              ),
                              suffixIcon: IconButton(
                                  icon: controller.isObscure.value
                                      ? Icon(Icons.visibility_off,
                                          size: 20, color: Colors.grey)
                                      : Icon(
                                          Icons.visibility,
                                          size: 20,
                                          color: Color(0xff08B197),
                                        ),
                                  onPressed: () {
                                    controller.isObscure.value =
                                        !controller.isObscure.value;
                                  }),
                              hintText: 'Masukan password konfirmasi',
                              hintStyle: GoogleFonts.openSans(
                                color: Colors.grey[400],
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 30),
                        width: double.infinity,
                        child: Obx(() => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                elevation: 5.0,
                                padding: EdgeInsets.all(15.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              onPressed: () {
                                controller.register(context);
                              },
                              child: controller.isloading.isFalse
                                  ? Text(
                                      'DAFTAR',
                                      style: TextStyle(
                                        color: Color(0xFF527DAA),
                                        letterSpacing: 1.5,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'OpenSans',
                                      ),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Loading....",
                                            style: GoogleFonts.openSans(
                                                color: Color(0xFF527DAA),
                                                letterSpacing: 1.5,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          height: 8,
                                          width: 8,
                                          child: CircularProgressIndicator(
                                              color: Color(0xFF527DAA)),
                                        )
                                      ],
                                    ),
                            ))),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(right: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Butuh bantuan?',
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 0.0),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Help ',
                                    style: GoogleFonts.openSans(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ]),
            ))
      ]),
    );
  }
}
