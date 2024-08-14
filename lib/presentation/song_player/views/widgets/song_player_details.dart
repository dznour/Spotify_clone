import 'package:flutter/material.dart';

import '../../../../common/widgets/favorite_button/favorite_button.dart';
import '../../../../domain/entities/home/song/song_entity.dart';

class SongPlayerDetails extends StatelessWidget {
  const SongPlayerDetails({super.key, required this.song});
  final SongEntity song;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                song.title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                song.artist,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
          FavoriteButton(song: song)
        ],
      ),
    );
  }
}
