import 'package:flutter/material.dart';

import '../../../../common/widgets/overlay/custom_overlay.dart';
import '../../../../core/configs/assets/app_images.dart';
import 'get_started_column.dart';
import '../../../../common/widgets/image_container/custom_container_image.dart';

class GetStartedBody extends StatelessWidget {
  const GetStartedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        CustomContainerImage(
          imagePath: AppImages.kIntorBg,
        ),
        CustomOverlay(),
        GetStartedColumn(),
      ],
    );
  }
}
