import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../common/widgets/appbar/basic_app_bar.dart';
import '../../../../domain/entities/home/song/song_entity.dart';
import 'song_player_cover.dart';
import 'song_player_details.dart';
import 'song_player_slider.dart';

class SongPlayerBody extends StatelessWidget {
  const SongPlayerBody({super.key, required this.song});
  final SongEntity song;
  @override
  Widget build(BuildContext context) {
    log(song.title);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BasicAppBar(
                hideBack: true,
                title: const Text(
                  'Now Playing',
                  style: TextStyle(fontSize: 18),
                ),
                actions: IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.ellipsisVertical)),
              ),
              const SizedBox(
                height: 10,
              ),
              SongPlayerCover(song: song),
              const SizedBox(
                height: 10,
              ),
              SongPlayerDetails(
                song: song,
              ),
              const SizedBox(
                height: 10,
              ),
              const SongPlayerSlider()
            ],
          ),
        ),
      ),
    );
  }
}
