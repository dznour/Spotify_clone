import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/widgets/appbar/basic_app_bar.dart';
import '../../../../core/configs/assets/app_vectors.dart';
import 'auth_divider.dart';
import 'auth_footer.dart';
import 'auth_heading.dart';
import 'login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            BasicAppBar(
              hideBack: false,
              title: SvgPicture.asset(
                AppVectors.kLogo,
                height: 40,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const AuthHeading(
              title: 'Sign In',
            ),
            const SizedBox(
              height: 30,
            ),
            const LoginForm(),
            const SizedBox(
              height: 30,
            ),
            const AuthDivider(),
            const AuthFooter(
              isRegister: false,
            )
          ],
        ),
      )),
    );
  }
}
