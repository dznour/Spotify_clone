import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../domain/entities/home/song/song_entity.dart';

class SongModel {
  final String artist;
  final String title;
  final num duration;
  final Timestamp releaseDate;
  bool? isFavorite;
  String? songId;

  SongModel({
    required this.artist,
    required this.title,
    required this.duration,
    required this.releaseDate,
    this.isFavorite,
    this.songId,
  });

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      artist: json['artist'],
      title: json['title'],
      duration: json['duration'],
      releaseDate: json['releaseDate'],
    );
  }
}

extension SongModelX on SongModel {
  toSongEntity() {
    return SongEntity(
        artist: artist,
        songId: songId!,
        title: title,
        duration: duration,
        isFavorite: isFavorite ?? false,
        releaseDate: releaseDate);
  }
}
