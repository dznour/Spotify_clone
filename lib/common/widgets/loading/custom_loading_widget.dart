import 'package:flutter/material.dart';
import '../../../core/utils/is_dark_mode.dart';

import '../../../core/configs/theme/app_colors.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key, required this.loadingMessage});
  final String loadingMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            color: AppColors.kPrimaryColor,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            loadingMessage,
            style: TextStyle(
                fontSize: 22,
                color: context.isDarkMode ? Colors.white : Colors.black),
          )
        ],
      ),
    );
  }
}
