import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pusatani/const/colors.dart';
import 'package:pusatani/reusable/back_button.dart';
import 'package:pusatani/reusable/custom_elevated_button.dart';
import 'package:pusatani/reusable/custom_text_form_field.dart';
import 'package:pusatani/ui/add-product/add_product_controller.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(
        init: AddProductController(),
        builder: (c) => Scaffold(
              appBar: AppBar(
                title: const Text('Tambah Produk'),
                leading: const CustomBackButton(),
              ),
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
                            c.getProductPicture();
                          },
                          child: SizedBox(
                            height: 200,
                            child: DottedBorder(
                                padding: const EdgeInsets.all(4),
                                color: primaryColor,
                                dashPattern: [10],
                                strokeWidth: 3,
                                child: Center(
                                  child: c.productImage != null
                                      ? Image.file(
                                          c.productImage!,
                                          fit: BoxFit.fill,
                                          width: double.infinity,
                                        )
                                      : const Text('upload photo'),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        CustomTextFormField(
                          controller: c.nameController,
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
                        CustomTextFormField(
                          controller: c.priceController,
                          hintText: 'Rp 50.000',
                          label: 'Harga',
                          inputType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Harga produk tidak boleh kosong';
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
                                        borderRadius: BorderRadius.circular(5),
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
                                              c.stok = "Habis";
                                              c.update();
                                            }),
                                        Text(
                                          'Habis',
                                          style: GoogleFonts.catamaran(
                                              fontSize: 16),
                                        )
                                      ],
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            CustomTextFormField(
                              controller: c.descriptionController,
                              hintText: '',
                              maxLines: 7,
                              label: 'Deskripsi produk',
                              inputType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Deskripsi produk tidak boleh kosong';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomElevatedButton(
                                title: 'Tambah Produk', onTap: () {})
                          ],
                        ),
                      ],
                    )),
                  ),
                ),
              ),
            ));
  }
}
