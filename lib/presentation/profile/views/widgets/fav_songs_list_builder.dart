import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/error/custom_error_widget.dart';
import '../../../../common/widgets/loading/custom_loading_widget.dart';
import '../../cubits/get_fav_songs_cubit/get_fav_songs_cubit.dart';
import 'fav_song_list_view.dart';

class FavSongsListBuilder extends StatelessWidget {
  const FavSongsListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavSongsCubit, GetFavSongsState>(
      builder: (context, state) {
        if (state is GetFavSongsSuccess) {
          return FavSongListView(songs: state.songs);
        } else if (state is GetFavSongsError) {
          return CustomErrorWidget(
            error: state.errorMessage,
          );
        } else {
          return const CustomLoadingWidget(
            loadingMessage: 'Loading Favorite Songs',
          );
        }
      },
    );
  }
}
