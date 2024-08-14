import 'package:flutter/material.dart';

import 'widgets/signup_or_signin_body.dart';

class SignupOrSigninView extends StatelessWidget {
  const SignupOrSigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignupOrSigninBody(),
    );
  }
}
