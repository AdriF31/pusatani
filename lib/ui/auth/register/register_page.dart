import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pusatani/const/colors.dart';
import 'package:pusatani/const/font_weight.dart';
import 'package:pusatani/ui/auth/register/register_controller.dart';
import 'package:pusatani/ui/toko-pabrik/pendaftaran/add_toko_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
        init: RegisterController(),
        builder: (c) => Scaffold(
              appBar: AppBar(
                  title: const Text(
                'Register',
              )),
              body: SingleChildScrollView(
                child: Form(
                  key: c.formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 50),
                    child: Center(
                      child: Column(
                        children: [
                          InkWell(
                              onTap: () {
                                c.getProfilePicture();
                              },
                              child: c.profilePicture == null
                                  ? SvgPicture.asset('assets/images/avatar.svg')
                                  : Container(
                                      height: 120,
                                      width: 120,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle),
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
                                      return 'Nama lengkap tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          Column(
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Daftar Sebagai',
                                style: GoogleFonts.catamaran(
                                    fontSize: 16, color: primaryColor),
                              ),
                              Row(
                                children: [
                                  Container(
                                      height: 50,
                                      padding: const EdgeInsets.only(right: 8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: c.value == 1
                                                  ? primaryColor
                                                  : blackColor)),
                                      child: Row(
                                        children: [
                                          Radio(
                                              value: 1,
                                              groupValue: c.value,
                                              activeColor: primaryColor,
                                              onChanged: (value) {
                                                c.value = value!;
                                                c.role = 3;

                                                c.update();
                                              }),
                                          Text(
                                            'Toko',
                                            style: GoogleFonts.catamaran(
                                                fontSize: 16),
                                          )
                                        ],
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                      height: 50,
                                      padding: const EdgeInsets.only(right: 8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border:
                                              Border.all(color: primaryColor)),
                                      child: Row(
                                        children: [
                                          Radio(
                                              value: 0,
                                              groupValue: c.value,
                                              activeColor: primaryColor,
                                              onChanged: (value) {
                                                c.value = value!;
                                                c.role = 2;
                                                c.update();
                                              }),
                                          Text(
                                            'Pabrik',
                                            style: GoogleFonts.catamaran(
                                                fontSize: 16),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          InkWell(
                            onTap: () {
                              c.getIdPicture();
                            },
                            child: SizedBox(
                              height: 200,
                              child: DottedBorder(
                                  child: Center(
                                child: c.idPicture != null
                                    ? Image.file(
                                        c.idPicture!,
                                        fit: BoxFit.fill,
                                        width: double.infinity,
                                      )
                                    : const Text('upload photo'),
                              )),
                            ),
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
                                      return 'No whatsapp tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          Column(
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
                                        } else if (value.length < 6) {
                                          return 'Password harus lebih dari 6 karakter';
                                        }
                                        return null;
                                      },
                                    )),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Konfirmasi Password',
                                style: GoogleFonts.catamaran(
                                    fontSize: 16, color: primaryColor),
                              ),
                              SizedBox(
                                height: 60,
                                child: Obx(() => TextFormField(
                                      controller: c.confirmPasswordController,
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
                                        } else if (value.length < 6) {
                                          return 'Password harus lebih dari 6 karakter';
                                        }
                                        return null;
                                      },
                                    )),
                              ),
                              const SizedBox(
                                height: 18,
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
                                              borderRadius:
                                                  BorderRadius.circular(25))),
                                      onPressed: () {
                                        Get.to(() => AddTokoPage());
                                        if (c.formKey.currentState
                                                ?.validate() ==
                                            true) {
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
