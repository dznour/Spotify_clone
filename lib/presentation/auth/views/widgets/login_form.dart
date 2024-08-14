import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/button/basic_app_button.dart';
import '../../../../core/utils/app_router.dart';
import '../../cubits/login_cubit/login_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String email = '';
  String password = '';
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          var snackbar = const SnackBar(
            content: Text('Success'),
            behavior: SnackBarBehavior.floating,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        }
        if (state is LoginError) {
          var snackbar = SnackBar(
            content: Text(state.error),
            behavior: SnackBarBehavior.floating,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      },
      builder: (context, state) {
        return Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ).applyDefaults(Theme.of(context).inputDecorationTheme),
                  onChanged: (value) {
                    email = value;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Icon(FontAwesomeIcons.eye),
                      ),
                    ),
                  ).applyDefaults(Theme.of(context).inputDecorationTheme),
                  onChanged: (value) {
                    password = value;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                state is LoginLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : BasicAppButton(
                        onPressed: () {
                          BlocProvider.of<LoginCubit>(context)
                              .userLogin(email, password);
                        },
                        title: 'LOGIN',
                      )
              ],
            ));
      },
    );
  }
}
