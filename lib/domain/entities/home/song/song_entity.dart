import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntity {
  final String songId;
  final String artist;
  final String title;
  final num duration;
  final Timestamp releaseDate;
  final bool isFavorite;

  SongEntity({
    required this.songId,
    required this.artist,
    required this.title,
    required this.duration,
    required this.releaseDate,
    required this.isFavorite,
  });
}
