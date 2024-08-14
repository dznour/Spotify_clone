import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/widgets/appbar/basic_app_bar.dart';
import '../../../../core/configs/assets/app_images.dart';
import '../../../../core/configs/assets/app_vectors.dart';
import 'signup_or_sigin_column.dart';

class SignupOrSigninBody extends StatelessWidget {
  const SignupOrSigninBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          const BasicAppBar(
            hideBack: false,
          ),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.kTopRight),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.kBottomRight),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.kAuthBg),
          ),
          const Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SignUpOrSignInColumn(),
            ),
          )
        ],
      ),
    );
  }
}
