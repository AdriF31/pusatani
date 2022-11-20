import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pusatani/const/colors.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.label,
      this.textInputAction,
      this.validator,
      this.inputType,
      this.maxLines})
      : super(key: key);
  TextEditingController controller;
  String hintText;
  String label;
  final String? Function(String?)? validator;
  TextInputType? inputType;
  TextInputAction? textInputAction;
  int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.catamaran(fontSize: 16, color: primaryColor),
        ),
        TextFormField(
            controller: controller,
            keyboardType: inputType,
            maxLines: maxLines,
            textInputAction: textInputAction,
            decoration: InputDecoration(
                fillColor: primaryColor,
                hintText: hintText,
                hintStyle: GoogleFonts.catamaran(fontSize: 14),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                    borderRadius: BorderRadius.circular(5))),
            validator: validator),
      ],
    );
  }
}
