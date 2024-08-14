import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/entities/home/song/song_entity.dart';
import '../../cubits/favorite_button_cubit/favorite_button_cubit.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.song,
    this.function,
    this.fromProfile = false,
  });

  final SongEntity song;
  final Function? function;
  final bool fromProfile;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteButtonCubit(),
      child: BlocBuilder<FavoriteButtonCubit, FavoriteButtonState>(
        builder: (context, state) {
          if (state is FavoriteButtonInitial) {
            return IconButton(
                onPressed: () async {
                  await context
                      .read<FavoriteButtonCubit>()
                      .favoriteButtonUpdated(song.songId);
                  if (function != null) {
                    function!();
                  }
                },
                icon: fromProfile
                    ? const Icon(FontAwesomeIcons.trash)
                    : song.isFavorite
                        ? const Icon(
                            FontAwesomeIcons.solidHeart,
                            color: AppColors.kPrimaryColor,
                          )
                        : const Icon(FontAwesomeIcons.heart));
          }
          if (state is FavoriteButtonToggle) {
            return IconButton(
                onPressed: () async {
                  await context
                      .read<FavoriteButtonCubit>()
                      .favoriteButtonUpdated(song.songId);
                },
                icon: state.isFavorite
                    ? const Icon(
                        FontAwesomeIcons.solidHeart,
                        color: AppColors.kPrimaryColor,
                      )
                    : const Icon(FontAwesomeIcons.heart));
          }
          return Container();
        },
      ),
    );
  }
}
