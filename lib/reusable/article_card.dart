import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pusatani/const/font_weight.dart';

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
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Card(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(image!),
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
                        fontSize: 14,
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
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    description!,
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
    );
  }
}
