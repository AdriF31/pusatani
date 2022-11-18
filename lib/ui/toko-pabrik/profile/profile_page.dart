import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pusatani/const/colors.dart';
import 'package:pusatani/const/font_weight.dart';
import 'package:pusatani/const/text_style.dart';
import 'package:pusatani/reusable/profile_button.dart';
import 'package:pusatani/ui/toko-pabrik/profile/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (c) => Scaffold(
        body: Column(children: [
          Stack(
            children: [
              Container(
                height: 250,
                color: primaryColor,
              ),
              SvgPicture.asset('assets/images/decoration.svg'),
              Positioned(
                  top: 160,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          width: 140,
                          height: 140,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/img_slider1.jpg'),
                          ),
                        ),
                      ),
                      Text(
                        'Iu hiyahiya',
                        style: blackTextStyle.copyWith(
                            fontSize: 24, fontWeight: semiBold),
                      ),
                      Text(
                        'dray@gmail.com',
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                        ),
                      )
                    ],
                  )),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                ProfileButton(
                  icon: Icons.person,
                  title: 'Ubah Profil',
                  onTap: () {},
                ),
                ProfileButton(
                  icon: Icons.store,
                  title: 'Ubah Toko',
                  onTap: () {},
                ),
                ProfileButton(
                  icon: Icons.key,
                  title: 'Ubah Password',
                  onTap: () {},
                ),
                ProfileButton(
                  icon: Icons.info,
                  title: 'Tentang Kami',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
