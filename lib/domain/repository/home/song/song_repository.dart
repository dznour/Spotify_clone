import 'package:dartz/dartz.dart';

import '../../../entities/home/song/song_entity.dart';

abstract class SongRepository {
  Future<Either<String, List<SongEntity>>> getSongs();
  Future<Either<String, List<SongEntity>>> getPlaylist();
  Future<Either> toggleFavoriteSong(String songId);
  Future<bool> isFavorite(String songId);
  Future<Either> getUserFavoriteSongs();
}
