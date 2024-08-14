import 'package:flutter/material.dart';

import 'widgets/choose_mode_body.dart';

class ChooseModeView extends StatelessWidget {
  const ChooseModeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChooseModeBody(),
    );
  }
}
