import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import '../../../../domain/entities/home/song/song_entity.dart';

class SongPlayerCover extends StatelessWidget {
  const SongPlayerCover({
    super.key,
    required this.song,
  });

  final SongEntity song;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            image: DecorationImage(
                image: CachedNetworkImageProvider(
                    '$kStorageBaseUrlCovers${song.title}.png$kMediaAlt'),
                fit: BoxFit.fill)),
      ),
    );
  }
}
