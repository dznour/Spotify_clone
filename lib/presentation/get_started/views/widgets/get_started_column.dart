import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/button/basic_app_button.dart';
import '../../../../core/configs/assets/app_vectors.dart';
import '../../../../core/configs/theme/app_colors.dart';
import '../../../../core/utils/app_router.dart';

class GetStartedColumn extends StatelessWidget {
  const GetStartedColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(AppVectors.kLogo),
            const Spacer(),
            const Text(
              'Enjoy Listening To Music',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'In enim mollit reprehenderit ipsum aliqua magna pariatur exercitation ipsum excepteur anim dolor nisi ullamco. Nisi mollit duis occaecat aute aliqua excepteur ex proident tempor consequat quis voluptate reprehenderit.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  color: AppColors.kGreyColor,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            BasicAppButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kChooseModelView);
                },
                title: 'Get Started'),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
