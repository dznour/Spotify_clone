import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/error/custom_error_widget.dart';
import '../../../../common/widgets/loading/custom_loading_widget.dart';
import '../../cubits/get_user_cubit.dart/get_user_cubit.dart';
import 'profile_heading.dart';

class ProfileHeadingBuilder extends StatelessWidget {
  const ProfileHeadingBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserCubit, GetUserState>(builder: (context, state) {
      if (state is GetUserSuccess) {
        return ProfileHeading(
          user: state.user,
        );
      } else if (state is GetUserError) {
        return CustomErrorWidget(
          error: state.errorMessage,
        );
      }
      return const CustomLoadingWidget(
        loadingMessage: 'Loading Profile Info',
      );
    });
  }
}
