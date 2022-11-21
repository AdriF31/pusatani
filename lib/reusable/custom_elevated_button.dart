// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pusatani/const/colors.dart';

import '../const/font_weight.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({Key? key, required this.title, required this.onTap})
      : super(
          key: key,
        );
  String title;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    borderRadius: BorderRadius.circular(25))),
            onPressed: onTap,
            child: Text(
              title,
              style: GoogleFonts.firaSans(
                  fontSize: 16, color: Colors.white, fontWeight: medium),
            )));
  }
}
