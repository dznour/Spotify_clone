import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/button/basic_app_button.dart';
import '../../../../core/configs/assets/app_vectors.dart';
import '../../../../core/utils/app_router.dart';
import '../../cubits/theme_mode_cubit/theme_mode_cubit.dart';
import 'mode_button.dart';

class ChooseModelColumn extends StatelessWidget {
  const ChooseModelColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(AppVectors.kLogo),
            const Spacer(),
            const Text(
              'Choose Mode',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<ThemeModeCubit, ThemeMode>(
                  builder: (context, mode) {
                    return ModeButton(
                        icon: FontAwesomeIcons.moon,
                        textMode: 'Dark Mode',
                        onTap: () {
                          BlocProvider.of<ThemeModeCubit>(context)
                              .updateTheme(ThemeMode.dark);
                        },
                        isSelected: mode == ThemeMode.dark);
                  },
                ),
                const SizedBox(
                  width: 30,
                ),
                BlocBuilder<ThemeModeCubit, ThemeMode>(
                  builder: (context, mode) {
                    return ModeButton(
                      icon: Icons.wb_sunny_outlined,
                      onTap: () {
                        context
                            .read<ThemeModeCubit>()
                            .updateTheme(ThemeMode.light);
                      },
                      textMode: 'Light Mode',
                      isSelected: mode == ThemeMode.light,
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            BasicAppButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kSignupOrSignInView);
                },
                title: 'Continue'),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
