import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pusatani/const/colors.dart';
import 'package:pusatani/const/font_weight.dart';
import 'package:pusatani/const/text_style.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class ArticleCard extends StatelessWidget {
  ArticleCard(
      {super.key,
      required this.image,
      required this.title,
      required this.date,
      required this.description});
  String? image;
  String? title;
  String? date;
  String? description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Card(
        color: secondaryColor,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.network(
                  image!,
                  fit: BoxFit.cover,
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
                ),
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
                      date!,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.catamaran(
                          fontSize: 16,
                          fontWeight: regular,
                          color: Colors.black54),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: Text(
                      title!,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.catamaran(
                        fontSize: 20,
                        fontWeight: semiBold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(description!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
