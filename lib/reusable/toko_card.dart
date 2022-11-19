import 'package:flutter/material.dart';
import 'package:pusatani/const/colors.dart';
import 'package:pusatani/const/text_style.dart';
import 'package:shimmer/shimmer.dart';

import '../const/font_weight.dart';

class TokoCard extends StatelessWidget {
  TokoCard({Key? key, required this.image, required this.title})
      : super(key: key);
  String image;
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: 160,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: secondaryColor,
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(image,
                    height: 140,
                    fit: BoxFit.fitHeight,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.grey.shade400,
                        direction: ShimmerDirection.ltr,
                        child: Container(
                          width: double.infinity,
                          height: 140,
                          color: Colors.grey,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => Container(
                          width: double.infinity,
                          height: 140,
                          color: Colors.grey,
                        )),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.all(4),
                child: Text(
                  title,
                  style: whiteTextStyle.copyWith(
                      fontSize: 18, fontWeight: semiBold),
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
