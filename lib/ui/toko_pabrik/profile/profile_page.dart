import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusatani/const/colors.dart';
import 'package:pusatani/const/font_weight.dart';
import 'package:pusatani/const/text_style.dart';
import 'package:pusatani/reusable/profile_button.dart';
import 'package:pusatani/ui/petani/home/petani_home_page.dart';
import 'package:pusatani/ui/toko_pabrik/edit-profil/edit_profile_page.dart';
import 'package:pusatani/ui/toko_pabrik/profile/profile_controller.dart';
import 'package:pusatani/ui/toko_pabrik/ubah-password/edit_password_page.dart';

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
              Image.asset('assets/images/decoration.png'),
              Positioned(
                  top: 140,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          width: 140,
                          height: 140,
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "http://pusatani.masuk.web.id/images/profile/${c.storage.getCurrentProfilePicture() ?? ''}"),
                          ),
                        ),
                      ),
                      Text(
                        c.storage.getCurrentUsername() ?? '',
                        style: blackTextStyle.copyWith(
                            fontSize: 24, fontWeight: semiBold),
                      ),
                      Text(
                        c.storage.getCurrentEmail() ?? '',
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
                  onTap: () => Get.to(() => const EditProfilePage()),
                ),
                Visibility(
                  visible: c.storage.getCurrentPabrikIdFromUser() != null ||
                      c.storage.getCurrentStoreIdFromUser() != null,
                  child: ProfileButton(
                    icon: Icons.store,
                    title: c.storage.getCurrentRole() == 3
                        ? 'Ubah Toko'
                        : 'Ubah Pabrik',
                    onTap: () {
                      Get.to(() => const PetaniHomePage());
                    },
                  ),
                ),
                ProfileButton(
                  icon: Icons.key,
                  title: 'Ubah Password',
                  onTap: () {
                    Get.to(() => const EditPasswordPage());
                  },
                ),
                ProfileButton(
                  icon: Icons.info,
                  title: 'Tentang Kami',
                  onTap: () {},
                ),
                ProfileButton(
                  icon: Icons.logout,
                  title: 'Logout',
                  onTap: () {
                    c.logout();
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
