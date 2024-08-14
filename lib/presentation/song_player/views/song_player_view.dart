import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/constants.dart';
import '../../../domain/entities/home/song/song_entity.dart';
import '../cubits/cubit/song_player_cubit.dart';
import 'widgets/song_player_body.dart';

class SongPlayerView extends StatelessWidget {
  const SongPlayerView({super.key, required this.song});
  final SongEntity song;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SongPlayerCubit()
          ..loadSong('$kStorageBaseUrlSongs${song.title}.mp3$kMediaAlt'),
        child: SongPlayerBody(
          song: song,
        ),
      ),
    );
  }
}
