import 'package:flutter/material.dart';

import '../../../../domain/entities/home/song/song_entity.dart';
import 'fav_song_item.dart';

class FavSongListView extends StatelessWidget {
  const FavSongListView({super.key, required this.songs});
  final List<SongEntity> songs;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return FavSongItem(
            song: songs[index],
            index: index,
          );
        },
        itemCount: songs.length,
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ));
  }
}
