import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pusatani/const/colors.dart';
import 'package:pusatani/reusable/back_button.dart';
import 'package:pusatani/reusable/custom_text_form_field.dart';
import 'package:pusatani/ui/toko_pabrik/edit/edit_product_controller.dart';

import '../../../reusable/custom_elevated_button.dart';

class EditProductPage extends StatelessWidget {
  const EditProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProductController>(
      init: EditProductController(),
      builder: (c) => Scaffold(
        appBar: AppBar(
          title: Text(c.storage.getCurrentRole() == 3
              ? 'Ubah Data Produk'
              : 'Ubah Data Gabah'),
          leading: const CustomBackButton(),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: c.formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 50),
              child: Center(
                  child: Column(
                children: [
                  InkWell(
                    splashColor: primaryColor,
                    onTap: () {
                      c.getProductPicture();
                    },
                    child: SizedBox(
                      height: 200,
                      child: DottedBorder(
                          padding: const EdgeInsets.all(2),
                          color: primaryColor,
                          dashPattern: const [10],
                          strokeWidth: 3,
                          child: Center(
                              child: c.productImage != null
                                  ? Image.file(
                                      c.productImage!,
                                      fit: BoxFit.fill,
                                      width: double.infinity,
                                    )
                                  : Image.network(
                                      c.storage.getCurrentRole() == 3
                                          ? 'http://pusatani.masuk.web.id/images/produk/${Get.arguments['image']}'
                                          : 'http://pusatani.masuk.web.id/images/gabah/${Get.arguments['image']}',
                                      fit: BoxFit.cover,
                                    )
                              // : (Text(
                              //     c.storage.getCurrentRole() == 3
                              //         ? 'upload foto produk'
                              //         : 'upload foto gabah',
                              //     style:
                              //         greenTextStyle.copyWith(fontSize: 18),
                              //   )),
                              )),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                    controller: c.nameController
                      ..text = Get.arguments['title'] ?? '',
                    hintText: 'Pupuk urea',
                    label: 'Nama Produk',
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nama produk tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Harga',
                        style: GoogleFonts.catamaran(
                            fontSize: 16, color: primaryColor),
                      ),
                      TextFormField(
                        controller: c.priceController
                          ..text = c.formatter
                              .format(Get.arguments['price'].toString()),
                        keyboardType: TextInputType.number,
                        inputFormatters: [c.formatter],
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            fillColor: primaryColor,
                            hintText: 'Rp 100000',
                            hintStyle: GoogleFonts.catamaran(fontSize: 14),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor),
                                borderRadius: BorderRadius.circular(5))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Harga produk tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Visibility(
                    visible: c.storage.getCurrentRole() == 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Stok',
                          style: GoogleFonts.catamaran(
                              fontSize: 16, color: primaryColor),
                        ),
                        Row(
                          children: [
                            Container(
                                height: 50,
                                padding: const EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
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
                                          c.stok = "Tersedia";

                                          c.update();
                                        }),
                                    Text(
                                      'Tersedia',
                                      style:
                                          GoogleFonts.catamaran(fontSize: 16),
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
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: primaryColor)),
                                child: Row(
                                  children: [
                                    Radio(
                                        value: 0,
                                        groupValue: c.value,
                                        activeColor: primaryColor,
                                        onChanged: (value) {
                                          c.value = value!;
                                          c.stok = "Habis";

                                          c.update();
                                        }),
                                    Text(
                                      'Habis',
                                      style:
                                          GoogleFonts.catamaran(fontSize: 16),
                                    )
                                  ],
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        c.storage.getCurrentRole() == 3
                            ? 'Deskripsi Produk'
                            : 'Deskripsi Gabah',
                        style: GoogleFonts.catamaran(
                            fontSize: 16, color: primaryColor),
                      ),
                      SizedBox(
                        height: 100,
                        child: TextFormField(
                          controller: c.descriptionController
                            ..text = Get.arguments['deskripsi'] ?? '',
                          textInputAction: TextInputAction.next,
                          maxLines: 5,
                          decoration: InputDecoration(
                              fillColor: primaryColor,
                              hintText: '',
                              hintStyle: GoogleFonts.catamaran(fontSize: 14),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 4),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                  borderRadius: BorderRadius.circular(5))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Deskripsi tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomElevatedButton(
                      title: 'Ubah Produk',
                      onTap: () async {
                        if (c.formKey.currentState?.validate() == true) {
                          if (c.storage.getCurrentRole() == 2) {
                            c.updateProduct(Get.arguments['id']);
                          } else if (c.storage.getCurrentRole() == 3) {
                            c.updateProduct(Get.arguments['id']);
                          }
                        }
                      }),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
