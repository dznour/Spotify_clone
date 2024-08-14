import 'package:dartz/dartz.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../domain/entities/home/song/song_entity.dart';
import '../../../../domain/repository/home/song/song_repository.dart';
import '../../../sources/song/song_firebase_service.dart';

class SongRepositoryImpl extends SongRepository {
  @override
  Future<Either<String, List<SongEntity>>> getSongs() async {
    return await sl<SongFirebaseService>().getSongs();
  }

  @override
  Future<Either<String, List<SongEntity>>> getPlaylist() async {
    return await sl<SongFirebaseService>().getPlaylist();
  }

  @override
  Future<Either> toggleFavoriteSong(String songId) async {
    return await sl<SongFirebaseService>().toggleFavoriteSong(songId);
  }

  @override
  Future<bool> isFavorite(String songId) async {
    return await sl<SongFirebaseService>().isFavorite(songId);
  }

  @override
  Future<Either> getUserFavoriteSongs() async {
    return await sl<SongFirebaseService>().getUserFavoriteSongs();
  }
}
