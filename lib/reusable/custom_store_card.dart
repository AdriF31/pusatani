import 'package:flutter/material.dart';
import 'package:pusatani/const/text_style.dart';

import '../const/font_weight.dart';

class CustomStoreCard extends StatelessWidget {
  CustomStoreCard(
      {Key? key,
      required this.image,
      required this.name,
      required this.address})
      : super(key: key);
  String? name;
  String? address;
  String? image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                    image!,
                    fit: BoxFit.fitHeight,
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
                    name!,
                    style: blackTextStyle.copyWith(
                        fontSize: 18, fontWeight: semiBold),
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                  ),
                  Text(
                    address!,
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
    );
  }
}
