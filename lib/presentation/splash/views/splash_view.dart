import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/app_router.dart';
import 'widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigateToGetStarted();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }

  void navigateToGetStarted() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        // Get.to(() => const HomeView(),
        //     // calculations
        //     transition: Transition.fade,
        //     duration: kTranstionDuration);

        GoRouter.of(context).pushReplacement(AppRouter.kGetStartedView);
      },
    );
  }
}
