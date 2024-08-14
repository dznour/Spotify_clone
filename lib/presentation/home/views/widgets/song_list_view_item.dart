import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/is_dark_mode.dart';

import '../../../../core/configs/theme/app_colors.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/constants.dart';
import '../../../../domain/entities/home/song/song_entity.dart';

class SongListViewItem extends StatelessWidget {
  const SongListViewItem({super.key, required this.song});
  final SongEntity song;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kSongPlayerView, extra: song);
      },
      child: SizedBox(
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                      '$kStorageBaseUrlCovers${song.title}.png$kMediaAlt',
                    ),
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 40,
                    width: 40,
                    transform: Matrix4.translationValues(10, 10, 0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.isDarkMode
                          ? AppColors.kGreyColor
                          : const Color(0xffE6E6E6),
                    ),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: context.isDarkMode
                          ? const Color(0xff959595)
                          : const Color(0xff555555),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              song.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              song.artist,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
