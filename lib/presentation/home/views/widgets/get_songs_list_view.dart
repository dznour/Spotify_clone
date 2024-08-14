import 'package:flutter/material.dart';

import '../../../../domain/entities/home/song/song_entity.dart';
import 'song_list_view_item.dart';

class GetSongsListView extends StatelessWidget {
  const GetSongsListView({
    super.key,
    required this.songs,
  });
  final List<SongEntity> songs;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => SongListViewItem(song: songs[index]),
      itemCount: songs.length,
      separatorBuilder: (context, index) => const SizedBox(
        width: 15,
      ),
    );
  }
}
