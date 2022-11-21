import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusatani/const/colors.dart';
import 'package:pusatani/const/text_style.dart';
import 'package:pusatani/reusable/custom_elevated_button.dart';
import 'package:pusatani/ui/toko-pabrik/edit/edit_product_page.dart';
import 'package:pusatani/ui/toko-pabrik/home/home_controller.dart';
import 'package:pusatani/ui/toko-pabrik/pendaftaran/add_toko_page.dart';

import '../../../const/font_weight.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (c) => c.storage.getCurrentPabrikIdFromUser() != null ||
                c.storage.getCurrentStoreIdFromUser() != null
            ? Scaffold(
                body: SafeArea(
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Hai ${c.storage.getCurrentUsername()},\nSelamat datang di PusaTanI',
                              style: blackTextStyle.copyWith(
                                  fontSize: 18, fontWeight: semiBold),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: blackColor, shape: BoxShape.circle),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'http://pusatani.masuk.web.id/images/profile/${c.storage.getCurrentProfilePicture() ?? ''}'),
                                radius: 50,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: 150,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                c.storage.getCurrentRole() == 3
                                    ? c.detailTokoModel?.data?.data?.name ?? ''
                                    : c.detailPabrikModel.data?.data?.name ??
                                        '',
                                style: whiteTextStyle.copyWith(
                                    fontSize: 24, color: Colors.white),
                              ),
                              Text(
                                c.storage.getCurrentRole() == 3
                                    ? c.detailTokoModel?.data?.data?.address ??
                                        ''
                                    : c.detailPabrikModel.data?.data?.address ??
                                        '',
                                style: whiteTextStyle.copyWith(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                          Container(
                            width: Get.width * 0.3,
                            height: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                c.storage.getCurrentRole() == 3
                                    ? 'http://pusatani.masuk.web.id/images/toko/${c.detailTokoModel?.data?.data?.image}'
                                    : 'http://pusatani.masuk.web.id/images/pabrik/${c.detailPabrikModel.data?.data?.image}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            height: 150,
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Status Akun',
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    Text(
                                      'Verified',
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 28,
                                          color: Colors.white,
                                          fontWeight: bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 150,
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      c.storage.getCurrentRole() == 3
                                          ? 'Jumlah Produk'
                                          : 'Jumlah Gabah',
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    Text(
                                      c.storage.getCurrentRole() == 3
                                          ? c.detailTokoModel!.data!.data!
                                              .tokoToProduk!.length
                                              .toString()
                                          : c.detailPabrikModel.data!.data!
                                              .pabrikToGabah!.length
                                              .toString(),
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 32,
                                          color: Colors.white,
                                          fontWeight: bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        c.storage.getCurrentRole() == 3 ? 'Produk' : 'Gabah',
                        style: blackTextStyle.copyWith(
                            fontSize: 24, fontWeight: semiBold),
                      ),
                    ),
                    Column(
                        children: c.storage.getCurrentRole() == 3
                            ? c.detailTokoModel!.data!.data!.tokoToProduk!
                                .asMap()
                                .map((index, element) => MapEntry(
                                    index,
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 4),
                                      child: Stack(
                                        children: [
                                          SizedBox(
                                            width: double.infinity,
                                            height: 150,
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              elevation: 3,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 120,
                                                    height: double.infinity,
                                                    child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .horizontal(
                                                                left: Radius
                                                                    .circular(
                                                                        20)),
                                                        child: Image.network(
                                                          '${element.image}',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 6,
                                                  ),
                                                  Column(
                                                    children: [
                                                      SizedBox(
                                                        width: Get.width * 0.5,
                                                        child: Text(
                                                          element.name ?? '-',
                                                          style: blackTextStyle
                                                              .copyWith(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      medium),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: Get.width * 0.5,
                                                        child: Text(
                                                          c.formatter.format(
                                                              element.price
                                                                  .toString()),
                                                          style: blackTextStyle
                                                              .copyWith(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      semiBold),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: Get.width * 0.5,
                                                        child: Text(
                                                          element.id.toString(),
                                                          style: blackTextStyle
                                                              .copyWith(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      regular),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                              right: 8,
                                              top: 8,
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: PopupMenuButton<int>(
                                                  offset: const Offset(0, 0),
                                                  itemBuilder: (context) => [
                                                    PopupMenuItem<int>(
                                                        value: 0,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            Get.to(
                                                                () =>
                                                                    const EditProductPage(),
                                                                arguments:
                                                                    element.id);
                                                          },
                                                          child: Row(
                                                            children: const [
                                                              Icon(
                                                                Icons.edit,
                                                                color: Colors
                                                                    .yellow,
                                                              ),
                                                              Text(
                                                                'Edit',
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                    PopupMenuItem<int>(
                                                        value: 1,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            c.deleteData(
                                                                element.id!);
                                                            c.update();

                                                            c.getData();
                                                          },
                                                          child: Row(
                                                            children: const [
                                                              Icon(
                                                                Icons.delete,
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                              Text(
                                                                'Hapus',
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                  ],
                                                  child: const Icon(
                                                    Icons.more_vert,
                                                    size: 24,
                                                  ),
                                                ),
                                              )),
                                        ],
                                      ),
                                    )))
                                .values
                                .toList()

                                
                            : c.detailPabrikModel.data!.data!.pabrikToGabah!
                                .asMap()
                                .map((index, element) => MapEntry(
                                    index,
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 4),
                                      child: Stack(
                                        children: [
                                          SizedBox(
                                            width: double.infinity,
                                            height: 150,
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              elevation: 3,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 120,
                                                    height: double.infinity,
                                                    child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .horizontal(
                                                                left: Radius
                                                                    .circular(
                                                                        20)),
                                                        child: Image.network(
                                                          'http://pusatani.masuk.web.id/images/produk/${element.image}',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 6,
                                                  ),
                                                  Column(
                                                    children: [
                                                      SizedBox(
                                                        width: Get.width * 0.5,
                                                        child: Text(
                                                          element.name ?? '-',
                                                          style: blackTextStyle
                                                              .copyWith(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      medium),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: Get.width * 0.5,
                                                        child: Text(
                                                          c.formatter.format(
                                                              element.price
                                                                  .toString()),
                                                          style: blackTextStyle
                                                              .copyWith(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      semiBold),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: Get.width * 0.5,
                                                        child: Text(
                                                          element.id.toString(),
                                                          style: blackTextStyle
                                                              .copyWith(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      regular),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                              right: 8,
                                              top: 8,
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: PopupMenuButton<int>(
                                                  offset: const Offset(0, 0),
                                                  itemBuilder: (context) => [
                                                    PopupMenuItem<int>(
                                                        value: 0,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            Get.to(
                                                                () =>
                                                                    const EditProductPage(),
                                                                arguments:
                                                                    element.id);
                                                          },
                                                          child: Row(
                                                            children: const [
                                                              Icon(
                                                                Icons.edit,
                                                                color: Colors
                                                                    .yellow,
                                                              ),
                                                              Text(
                                                                'Edit',
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                    PopupMenuItem<int>(
                                                        value: 1,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            c.deleteData(
                                                                element.id!);
                                                            c.update();

                                                            c.getData();
                                                          },
                                                          child: Row(
                                                            children: const [
                                                              Icon(
                                                                Icons.delete,
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                              Text(
                                                                'Hapus',
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                  ],
                                                  child: const Icon(
                                                    Icons.more_vert,
                                                    size: 24,
                                                  ),
                                                ),
                                              )),
                                        ],
                                      ),
                                    )))
                                .values
                                .toList()),
                  ],
                )),
              ))
            : Scaffold(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      c.storage.getCurrentRole() == 3
                          ? 'Hai ${c.storage.getCurrentUsername()} Anda Belum mendaftarkan tokomu\n silahkan daftarkan tokomu dan bergabung bersama kami di PusaTanI'
                          : 'Hai ${c.storage.getCurrentUsername()} Kamu belum mendaftarkan pabrikmu\n silahkan daftarkan pabrikmu dan bergabung bersama kami di PusaTanI',
                      style: greenTextStyle.copyWith(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: CustomElevatedButton(
                          title: c.storage.getCurrentRole() == 3
                              ? 'Buat Toko Sekarang'
                              : 'Buat Pabrik Sekarang',
                          onTap: () {
                            if (c.storage.getCurrentRole() == 2) {
                              Get.to(() => AddTokoPage());
                            } else if (c.storage.getCurrentRole() == 3) {
                              Get.to(() => AddTokoPage());
                            }
                          }),
                    )
                  ],
                ),
              ));
  }
}
