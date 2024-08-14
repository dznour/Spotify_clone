import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/login_cubit/login_cubit.dart';
import 'widgets/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: const LoginBody(),
      ),
    );
  }
}
