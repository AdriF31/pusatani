import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pusatani/ui/detail/detail_page.dart';
import 'package:pusatani/ui/petani/infotani/info_tani_controller.dart';

import '../../../const/colors.dart';
import '../../../const/font_weight.dart';

class InfoTaniPage extends StatefulWidget {
  const InfoTaniPage({Key? key}) : super(key: key);

  @override
  State<InfoTaniPage> createState() => _InfoTaniPageState();
}

class _InfoTaniPageState extends State<InfoTaniPage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfoTaniController>(
        init: InfoTaniController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(title: const Text('info Tani')),
            body: Column(
              children: [
                SafeArea(
                    child: Container(
                  height: 10,
                )),
                ButtonsTabBar(
                  controller: tabController,
                  backgroundColor: primaryColor,
                  height: 60,
                  unselectedBackgroundColor: Colors.transparent,
                  labelStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  borderWidth: 1,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  unselectedBorderColor: blackColor,
                  tabs: const [
                    Tab(
                      text: 'Semua',
                    ),
                    Tab(
                      text: "Teknologi",
                    ),
                    Tab(
                      text: "Pertanian",
                    ),
                    Tab(
                      text: "Hama dan Penyakit",
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: <Widget>[
                      semua(),
                      teknologi(),
                      pertanian(),
                      hama(),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget semua() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Card(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('assets/images/img_slider1.jpg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          '31 Februari 2022',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.catamaran(
                              fontSize: 14,
                              fontWeight: regular,
                              color: Colors.black54),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(
                          'Aku suka membajak membajak membajak. ini konten beritana nya bingung diisi naon',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.catamaran(
                            fontSize: 20,
                            fontWeight: semiBold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Aku suka membajak membajak membajak. ini konten beritana nya bingung diisi naon',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.catamaran(
                            fontSize: 16,
                            fontWeight: regular,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget teknologi() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Get.to(() => const DetailPage()),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('assets/images/img_slider1.jpg'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 300,
                          child: Text(
                            '31 Februari 2022',
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.catamaran(
                                fontSize: 14,
                                fontWeight: regular,
                                color: Colors.black54),
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: Text(
                            'Aku suka membajak membajak membajak. ini konten beritana nya bingung diisi naon',
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.catamaran(
                              fontSize: 20,
                              fontWeight: semiBold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Aku suka membajak membajak membajak. ini konten beritana nya bingung diisi naon',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.catamaran(
                              fontSize: 16,
                              fontWeight: regular,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget pertanian() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Card(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('assets/images/img_slider1.jpg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          '31 Februari 2022',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.catamaran(
                              fontSize: 14,
                              fontWeight: regular,
                              color: Colors.black54),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(
                          'Aku suka membajak membajak membajak. ini konten beritana nya bingung diisi naon',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.catamaran(
                            fontSize: 20,
                            fontWeight: semiBold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Aku suka membajak membajak membajak. ini konten beritana nya bingung diisi naon',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.catamaran(
                            fontSize: 16,
                            fontWeight: regular,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget hama() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Card(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('assets/images/img_slider1.jpg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          '31 Februari 2022',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.catamaran(
                              fontSize: 14,
                              fontWeight: regular,
                              color: Colors.black54),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(
                          'Aku suka membajak membajak membajak. ini konten beritana nya bingung diisi naon',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.catamaran(
                            fontSize: 20,
                            fontWeight: semiBold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Aku suka membajak membajak membajak. ini konten beritana nya bingung diisi naon',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.catamaran(
                            fontSize: 16,
                            fontWeight: regular,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
