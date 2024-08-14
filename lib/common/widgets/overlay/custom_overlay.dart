import 'package:flutter/material.dart';

class CustomOverlay extends StatelessWidget {
  const CustomOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.15),
    );
  }
}
