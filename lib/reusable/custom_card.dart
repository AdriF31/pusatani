import 'package:flutter/material.dart';
import 'package:pusatani/const/colors.dart';
import 'package:pusatani/const/text_style.dart';
import 'package:basic_utils/basic_utils.dart';
import '../const/font_weight.dart';

// ignore: must_be_immutable
class CustomProductCard extends StatelessWidget {
  CustomProductCard(
      {super.key,
      required this.toko,
      required this.alamat,
      required this.image,
      required this.stok});
  String? image;
  String? toko;
  String? alamat;
  String? stok;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Stack(
        children: [
          Card(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                SizedBox(
                  width: 150,
                  height: double.infinity,
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        '$image',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        toko!,
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                      ),
                      Text(
                        alamat!,
                        style: greyTextStyle.copyWith(
                            fontSize: 14, fontWeight: semiBold),
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: Container(
              height: 20,
              width: 100,
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  stok!,
                  style:
                      whiteTextStyle.copyWith(fontSize: 14, fontWeight: medium),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
