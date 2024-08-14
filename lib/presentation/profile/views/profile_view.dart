import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/get_user_cubit.dart/get_user_cubit.dart';
import 'widgets/profile_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetUserCubit()..getUser(),
      child: const Scaffold(
        body: ProfileBody(),
      ),
    );
  }
}
