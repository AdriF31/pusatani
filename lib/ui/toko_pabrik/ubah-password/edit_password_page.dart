import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pusatani/const/colors.dart';
import 'package:pusatani/const/font_weight.dart';
import 'package:pusatani/ui/toko_pabrik/ubah-password/edit_password_controller.dart';

class EditPasswordPage extends StatelessWidget {
  const EditPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditPasswordController>(
      init: EditPasswordController(),
      builder: (c) => Scaffold(
        appBar: AppBar(
            title: const Text(
          'Register',
        )),
        body: SingleChildScrollView(
          child: Form(
            key: c.formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 50),
              child: Center(
                child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          // c.getProfilePicture();
                        },
                        child: c.profilePicture == null
                            ? SvgPicture.asset('assets/images/avatar.svg')
                            : Container(
                                height: 120,
                                width: 120,
                                decoration:
                                    const BoxDecoration(shape: BoxShape.circle),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(70),
                                  child: Image.file(
                                    c.profilePicture!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nama Lengkap',
                          style: GoogleFonts.catamaran(
                              fontSize: 16, color: primaryColor),
                        ),
                        SizedBox(
                          height: 60,
                          child: TextFormField(
                            controller: c.nameController,
                            decoration: InputDecoration(
                                fillColor: primaryColor,
                                hintText: 'Adri',
                                hintStyle: GoogleFonts.catamaran(fontSize: 14),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: primaryColor),
                                    borderRadius: BorderRadius.circular(5))),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Nama lengkap tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'No Whatsapp',
                          style: GoogleFonts.catamaran(
                              fontSize: 16, color: primaryColor),
                        ),
                        SizedBox(
                          height: 60,
                          child: TextFormField(
                            controller: c.phoneController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                fillColor: primaryColor,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 12),
                                  child: SizedBox(
                                    width: 50,
                                    child: Row(
                                      children: [
                                        Text(
                                          '+62',
                                          style: GoogleFonts.catamaran(
                                              fontSize: 16,
                                              color: blackColor,
                                              fontWeight: medium),
                                        ),
                                        SizedBox(
                                            height: 30,
                                            child: VerticalDivider(
                                              color: primaryColor,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                hintText: '8526277272',
                                hintStyle: GoogleFonts.catamaran(fontSize: 14),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: primaryColor),
                                    borderRadius: BorderRadius.circular(5))),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'No whatsapp tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
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
                            onPressed: () {
                              // Get.to(() => AddTokoPage());
                              if (c.formKey.currentState?.validate() == true) {
                                // c.register();
                              }
                            },
                            child: Text(
                              'Register',
                              style: GoogleFonts.firaSans(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: medium),
                            ))),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
