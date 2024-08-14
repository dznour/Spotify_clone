import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/utils/is_dark_mode.dart';

import '../../../../common/widgets/appbar/basic_app_bar.dart';
import '../../../../core/configs/theme/app_colors.dart';
import '../../../../domain/entities/auth/user_entity.dart';

class ProfileHeading extends StatelessWidget {
  const ProfileHeading({super.key, required this.user});
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: context.isDarkMode
              ? AppColors.kBottomNavigationBgColor
              : Colors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BasicAppBar(
            hideBack: true,
            title: Text(
              'Profile',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: context.isDarkMode ? Colors.white : Colors.black),
            ),
            actions: IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.ellipsisVertical)),
          ),
          CircleAvatar(
            radius: 55,
            backgroundColor:
                context.isDarkMode ? Colors.white : AppColors.kGreyColor,
            child: Icon(FontAwesomeIcons.heading,
                color: !context.isDarkMode ? Colors.white : Colors.black),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            user.email,
            style: TextStyle(
              color: context.isDarkMode ? Colors.white : Colors.black,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            user.fullName,
            style: TextStyle(
                color: context.isDarkMode ? Colors.white : Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
