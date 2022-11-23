import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pusatani/const/colors.dart';
import 'package:pusatani/const/font_weight.dart';
import 'package:pusatani/const/text_style.dart';
import 'package:pusatani/reusable/custom_text_form_field.dart';
import 'package:pusatani/ui/toko_pabrik/pendaftaran/add_toko_controller.dart';

class AddTokoPage extends StatelessWidget {
  const AddTokoPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddTokoController>(
        init: AddTokoController(),
        builder: (c) => Scaffold(
              appBar: AppBar(
                  title: Text(
                c.storage.getCurrentRole().toString(),
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
                              c.getIdPicture();
                            },
                            child: SizedBox(
                              height: 200,
                              child: DottedBorder(
                                  strokeWidth: 2,
                                  dashPattern: [10],
                                  color: primaryColor,
                                  child: Center(
                                    child: c.tokoImage != null
                                        ? Image.file(
                                            c.tokoImage!,
                                            fit: BoxFit.fill,
                                            width: double.infinity,
                                          )
                                        : Text(
                                            c.storage.getCurrentRole() == 3
                                                ? 'unggah foto toko'
                                                : 'unggah foto pabrik',
                                            style: greenTextStyle.copyWith(
                                                fontSize: 18,
                                                fontWeight: semiBold),
                                          ),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                c.storage.getCurrentRole() == 3
                                    ? 'Nama Toko'
                                    : 'Nama Pabrik',
                                style: GoogleFonts.catamaran(
                                    fontSize: 16, color: primaryColor),
                              ),
                              SizedBox(
                                height: 60,
                                child: TextFormField(
                                  controller: c.storeController,
                                  decoration: InputDecoration(
                                      fillColor: primaryColor,
                                      hintText: 'Adri Jaya',
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
                                      return 'Nama Toko tidak boleh kosong';
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
                                'Alamat',
                                style: GoogleFonts.catamaran(
                                    fontSize: 16, color: primaryColor),
                              ),
                              SizedBox(
                                height: 60,
                                child: TextFormField(
                                  controller: c.addressController,
                                  decoration: InputDecoration(
                                      fillColor: primaryColor,
                                      hintText: 'Jl trunojoyo no 2 ',
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
                                      return 'Alamat tidak boleh kosong';
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
                          CustomTextFormField(
                              controller: c.descController,
                              textInputAction: TextInputAction.done,
                              maxLines: 7,
                              hintText: '',
                              label: 'Deskripsi Toko'),
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
                                    if (c.formKey.currentState?.validate() ==
                                        true) {
                                      c.addToko();
                                    }
                                  },
                                  child: Text(
                                    c.storage.getCurrentRole() == 3
                                        ? 'Daftarkan Toko'
                                        : 'Daftarkan Pabrik',
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
            ));
  }
}
