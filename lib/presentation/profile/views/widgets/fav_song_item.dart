import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../common/widgets/favorite_button/favorite_button.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/is_dark_mode.dart';

import '../../../../domain/entities/home/song/song_entity.dart';
import '../../cubits/get_fav_songs_cubit/get_fav_songs_cubit.dart';

class FavSongItem extends StatelessWidget {
  const FavSongItem({super.key, required this.song, required this.index});
  final SongEntity song;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kSongPlayerView, extra: song);
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      '$kStorageBaseUrlCovers${song.title}.png$kMediaAlt',
                    ),
                    fit: BoxFit.fill),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        song.title,
                        style: TextStyle(
                            color: context.isDarkMode
                                ? Colors.white
                                : Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        song.artist,
                        style: const TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Text(
                  song.duration.toStringAsFixed(2).replaceAll('.', ':'),
                  style: const TextStyle(fontSize: 20),
                )),
            Expanded(
                flex: 1,
                child: FavoriteButton(
                  song: song,
                  fromProfile: true,
                  function: context.read<GetFavSongsCubit>().getFavSongs,
                ))
          ],
        ),
      ),
    );
  }
}
