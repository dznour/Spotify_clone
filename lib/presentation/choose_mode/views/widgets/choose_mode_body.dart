import 'package:flutter/material.dart';

import '../../../../common/widgets/image_container/custom_container_image.dart';
import '../../../../common/widgets/overlay/custom_overlay.dart';
import '../../../../core/configs/assets/app_images.dart';
import 'choose_mode_column.dart';

class ChooseModeBody extends StatelessWidget {
  const ChooseModeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        CustomContainerImage(imagePath: AppImages.kChooseMode),
        CustomOverlay(),
        ChooseModelColumn(),
      ],
    );
  }
}
