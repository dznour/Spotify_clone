import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/button/basic_app_button.dart';
import '../../../../core/configs/assets/app_vectors.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/is_dark_mode.dart';
import '../../../../core/configs/theme/app_colors.dart';

class SignUpOrSignInColumn extends StatelessWidget {
  const SignUpOrSignInColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppVectors.kLogo),
        const SizedBox(
          height: 15,
        ),
        const Text(
          'Enjoy Listening To Music',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const Text(
          'Spotify is a proprietary Swedish audio streaming and media services provider',
          style: TextStyle(color: AppColors.kGreyColor, fontSize: 17),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 45,
        ),
        Row(
          children: [
            Expanded(
              child: BasicAppButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kRegisterView);
                },
                title: 'Register',
                height: 80,
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                    minimumSize: const Size.fromHeight(80),
                    foregroundColor:
                        context.isDarkMode ? Colors.white : Colors.black),
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kLoginView);
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 100,
        )
      ],
    );
  }
}
