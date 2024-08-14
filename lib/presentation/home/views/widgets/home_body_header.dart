import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/configs/assets/app_images.dart';
import '../../../../core/configs/assets/app_vectors.dart';
import '../../../../core/configs/theme/app_colors.dart';

class HomeBodyHeader extends StatelessWidget {
  const HomeBodyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 140,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  AppColors.kPrimaryColor.withOpacity(0.6),
                  AppColors.kPrimaryColor
                ],
                end: Alignment.bottomRight,
                begin: Alignment.topLeft,
              ),
            ),
          ),
          const Positioned(
            left: 20,
            top: 60,
            right: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'New Album',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Happier Than Ever',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Billie Eilish',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 20,
            bottom: 0,
            child: Image.asset(
              AppImages.kHomeArtist,
              fit: BoxFit.cover,
              height: 180,
            ),
          ),
          Positioned(
            right: 0,
            top: 60,
            child: SvgPicture.asset(AppVectors.kTopRight),
          ),
        ],
      ),
    );
  }
}
