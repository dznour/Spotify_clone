import 'package:dartz/dartz.dart';

abstract class SongPlayerRepository {
  Future<Either> loadSong();
  Future<Either> playSong();
}
