import 'package:flutter/material.dart';

import '../../../../core/configs/theme/app_colors.dart';

class AuthHeading extends StatelessWidget {
  const AuthHeading({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('If You Need Any Support Please '),
            Text(
              'Click Here',
              style: TextStyle(color: AppColors.kPrimaryColor),
            )
          ],
        ),
      ],
    );
  }
}
