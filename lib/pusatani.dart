import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pusatani/const/colors.dart';
import 'package:pusatani/helper/scroll_configuration.dart';
import 'package:pusatani/ui/auth/login/login_page.dart';
import 'package:pusatani/ui/onboarding/onboarding_page.dart';
import 'package:pusatani/ui/petani/home/petani_home_page.dart';
import 'package:pusatani/ui/petani/infotani/info_tani_page.dart';
import 'package:pusatani/ui/splash/splash_page.dart';

class Pusatani extends StatelessWidget {
  const Pusatani({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        child =
            ScrollConfiguration(behavior: IosScrollBehavior(), child: child!);
        return child;
      },
      debugShowCheckedModeBanner: false,
      title: 'Pusatani',
      theme: ThemeData(
          inputDecorationTheme:
              InputDecorationTheme(border: OutlineInputBorder(gapPadding: 0)),
          colorScheme: ThemeData().colorScheme.copyWith(primary: primaryColor),
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
              backgroundColor: secondaryColor,
              centerTitle: true,
              titleTextStyle: GoogleFonts.firaSans(fontSize: 20))),
      home: OnboardingPage(),
    );
  }
}
