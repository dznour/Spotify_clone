import 'package:flutter/material.dart';

import '../../../../core/utils/is_dark_mode.dart';
import '../../../../core/configs/assets/app_images.dart';
import '../../../../core/configs/theme/app_colors.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({super.key, this.isRegister = true});
  final bool isRegister;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: Image.asset(AppImages.kGoogle),
            ),
            TextButton(
              onPressed: () {},
              child: Image.asset(AppImages.kApple),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isRegister
                  ? 'You Have An Account Already? '
                  : 'You Do Not Have An Account? ',
              style: TextStyle(
                  color: context.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            TextButton(
              child: Text(
                isRegister ? 'Sign In Here' : 'Register Here',
                style: const TextStyle(
                    color: AppColors.kPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              onPressed: () {},
            )
          ],
        ),
      ],
    );
  }
}
