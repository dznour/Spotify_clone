import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/register_cubit/register_cubit.dart';
import 'widgets/register_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const RegisterBody(),
      ),
    );
  }
}
