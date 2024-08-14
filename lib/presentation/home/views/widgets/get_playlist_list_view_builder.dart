import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/error/custom_error_widget.dart';
import '../../../../common/widgets/loading/custom_loading_widget.dart';
import '../../../../core/configs/theme/app_colors.dart';
import '../../cubits/get_playlist_cubit/get_playlist_cubit.dart';
import 'playlist_list_view_item.dart';

class GetPlaylistListViewBuilder extends StatelessWidget {
  const GetPlaylistListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPlaylistCubit, GetPlaylistState>(
      builder: (context, state) {
        if (state is GetPlaylistSuccess) {
          return ListView.separated(
              itemBuilder: (context, index) {
                return PlaylistListViewItem(song: state.songs[index]);
              },
              separatorBuilder: (context, index) => Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Divider(
                        color: AppColors.kGreyColor.withOpacity(0.3),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
              itemCount: state.songs.length);
        }
        if (state is GetPlaylistError) {
          return CustomErrorWidget(
            error: state.error,
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
