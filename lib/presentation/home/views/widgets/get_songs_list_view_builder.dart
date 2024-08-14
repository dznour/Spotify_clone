import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/error/custom_error_widget.dart';
import '../../../../common/widgets/loading/custom_loading_widget.dart';
import '../../cubits/get_songs_cubit/get_songs_cubit.dart';
import 'get_songs_list_view.dart';

class GetSongsListViewBuilder extends StatelessWidget {
  const GetSongsListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSongsCubit, GetSongsState>(
      builder: (context, state) {
        if (state is GetSongsSuccess) {
          return GetSongsListView(
            songs: state.songs,
          );
        }
        if (state is GetSongsError) {
          return CustomErrorWidget(
            error: state.errorMessage,
          );
        } else {
          return const CustomLoadingWidget(
            loadingMessage: 'Loading Music... Please Wait',
          );
        }
      },
    );
  }
}
