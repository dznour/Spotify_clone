import 'package:flutter/material.dart';

import 'widgets/get_started_body.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GetStartedBody(),
    );
  }
}
