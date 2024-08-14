import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../common/widgets/favorite_button/favorite_button.dart';
import '../../../../core/utils/is_dark_mode.dart';

import '../../../../core/configs/theme/app_colors.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../domain/entities/home/song/song_entity.dart';

class PlaylistListViewItem extends StatelessWidget {
  const PlaylistListViewItem({super.key, required this.song});
  final SongEntity song;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kSongPlayerView, extra: song);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.isDarkMode
                        ? AppColors.kGreyColor
                        : const Color(0xffE6E6E6)),
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: context.isDarkMode
                      ? const Color(0xff959595)
                      : const Color(0xff555555),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    song.artist,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 11),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Text(song.duration.toStringAsFixed(2).replaceAll('.', ':')),
              const SizedBox(
                width: 20,
              ),
              FavoriteButton(song: song)
            ],
          )
        ],
      ),
    );
  }
}
