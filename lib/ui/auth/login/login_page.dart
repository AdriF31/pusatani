import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pusatani/const/colors.dart';
import 'package:pusatani/const/font_weight.dart';
import 'package:pusatani/ui/auth/login/login_controller.dart';
import 'package:pusatani/ui/auth/register/register_page.dart';
import 'package:pusatani/ui/toko-pabrik/main/main_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (c) => Scaffold(
            body: c.isLoading == false
                ? SingleChildScrollView(
                    child: Form(
                      key: c.formKey,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset('assets/images/curve_bg.png'),
                              Positioned(
                                  top: 60,
                                  left: Get.width * 0.4,
                                  child: Center(
                                      child: Text(
                                    'LOGIN',
                                    style: GoogleFonts.catamaran(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: bold),
                                  ))),
                            ],
                          ),
                          Image.asset(
                            'assets/images/logo.png',
                            width: 150,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email',
                                  style: GoogleFonts.catamaran(
                                      fontSize: 16, color: primaryColor),
                                ),
                                SizedBox(
                                  height: 60,
                                  child: TextFormField(
                                    controller: c.emailController,
                                    decoration: InputDecoration(
                                        fillColor: primaryColor,
                                        hintText: 'user@gmail.com',
                                        hintStyle:
                                            GoogleFonts.catamaran(fontSize: 14),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 16),
                                        border: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: primaryColor),
                                            borderRadius:
                                                BorderRadius.circular(5))),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Email tidak boleh kosong';
                                      } else if (GetUtils.isEmail(value) ==
                                          false) {
                                        return 'Email tidak valid';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Password',
                                  style: GoogleFonts.catamaran(
                                      fontSize: 16, color: primaryColor),
                                ),
                                SizedBox(
                                  height: 60,
                                  child: Obx(() => TextFormField(
                                        controller: c.passwordController,
                                        obscureText: c.isObscured.isFalse,
                                        decoration: InputDecoration(
                                            counterText: '',
                                            isDense: true,
                                            suffixIcon: IconButton(
                                                onPressed: () {
                                                  c.isObscured.toggle();
                                                },
                                                icon: Icon(c.isObscured.isFalse
                                                    ? Icons.visibility
                                                    : Icons.visibility_off)),
                                            hintText: 'lebih dari 6 karakter',
                                            hintStyle: GoogleFonts.catamaran(
                                                fontSize: 14),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 16),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: primaryColor),
                                                borderRadius:
                                                    BorderRadius.circular(5))),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Password tidak boleh kosong';
                                          } else if (value.length < 5) {
                                            return 'Password harus lebih dari 6 karakter';
                                          }
                                          return null;
                                        },
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 24),
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  gradient: LinearGradient(
                                      colors: [
                                        secondaryColor,
                                        primaryColor.withOpacity(0.7),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      stops: const [0.2, 1])),
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                      // backgroundColor: secondaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25))),
                                  onPressed: () {
                                    // Get.offAll(() => MainPage());
                                    if (c.formKey.currentState?.validate() ==
                                        true) {
                                      c.isLoading = true;
                                      c.login();
                                      // print("OK");
                                      // Get.offAll(() => PetaniHomePage());
                                    }
                                  },
                                  child: Text(
                                    'Login',
                                    style: GoogleFonts.firaSans(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: medium),
                                  ))),
                          Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 50,
                              ),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(color: blackColor),
                                  borderRadius: BorderRadius.circular(25)),
                              height: 50,
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25))),
                                  onPressed: () {
                                    Get.to(() => const RegisterPage());
                                  },
                                  child: Text('Register',
                                      style: GoogleFonts.firaSans(
                                          fontSize: 16, fontWeight: medium)))),
                          // ClipPath(
                          //   clipper: WaveClipper(),
                          //   child: Container(
                          //     width: Get.width,
                          //     height: 300,
                          //     color: primaryColor,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  )));
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height / 2);
    var firstStart = Offset(size.width / 4, size.height - 100);
    var firstEnd = Offset(size.width / 2.25, size.height / 2);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    var secondStart =
        Offset(size.width - (size.width / 3.5), size.height - 200);
    var secondEnd = Offset(size.width - 40, size.height - 50);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    var thirdStart = Offset(size.width - 32, size.height - 30);
    var thirdEnd = Offset(size.width, size.height - 20);
    path.quadraticBezierTo(
        thirdStart.dx, thirdStart.dy, thirdEnd.dx, thirdEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
