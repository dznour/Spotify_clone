import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/button/basic_app_button.dart';
import '../../../../core/utils/app_router.dart';
import '../../cubits/register_cubit/register_cubit.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String email = '';
  String password = '';
  String fullName = '';
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          var snackbar = const SnackBar(
            content: Text('Success'),
            behavior: SnackBarBehavior.floating,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        }
        if (state is RegisterError) {
          var snackbar = SnackBar(
            content: Text(state.errorMessage),
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
                    hintText: 'Full Name',
                  ).applyDefaults(Theme.of(context).inputDecorationTheme),
                  onChanged: (value) {
                    fullName = value;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
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
                state is RegisterLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : BasicAppButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<RegisterCubit>(context)
                                .userRegister(
                              fullName: fullName,
                              email: email,
                              password: password,
                            );
                          }
                        },
                        title: 'Create An Account',
                      )
              ],
            ));
      },
    );
  }
}
