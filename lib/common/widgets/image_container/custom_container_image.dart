import 'package:flutter/material.dart';

class CustomContainerImage extends StatelessWidget {
  const CustomContainerImage({
    super.key,
    required this.imagePath,
  });
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill),
      ),
      child: Padding(padding: const EdgeInsets.all(16), child: Container()),
    );
  }
}
