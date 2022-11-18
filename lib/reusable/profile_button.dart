import 'package:flutter/material.dart';
import 'package:pusatani/const/colors.dart';
import 'package:pusatani/const/text_style.dart';

import '../const/font_weight.dart';

class ProfileButton extends StatelessWidget {
  ProfileButton({
    Key? key,required this.title, required this.icon,required this.onTap
  }) : super(key: key);
  String title;
  IconData icon;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: TextButton(
            onPressed:onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(icon),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      title,
                      style: buttonTextStyle.copyWith(
                          color: blackColor,
                          fontSize: 18,
                          fontWeight: semiBold),
                    ),
                  ],
                ),
                Icon(Icons.chevron_right)
              ],
            )),
      ),
    );
  }
}
