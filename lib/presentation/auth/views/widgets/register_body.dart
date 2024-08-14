import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/widgets/appbar/basic_app_bar.dart';
import '../../../../core/configs/assets/app_vectors.dart';
import 'auth_divider.dart';
import 'auth_footer.dart';
import 'auth_heading.dart';
import 'register_form.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

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
              title: 'Register',
            ),
            const SizedBox(
              height: 30,
            ),
            const RegisterForm(),
            const SizedBox(
              height: 30,
            ),
            const AuthDivider(),
            const AuthFooter()
          ],
        ),
      )),
    );
  }
}
