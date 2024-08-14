import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/services/service_locator.dart';
import '../../../core/utils/constants.dart';
import '../../../domain/entities/home/song/song_entity.dart';
import '../../../domain/use_cases/song/is_song_favorite_usecase.dart';
import '../../models/home/song/song_model.dart';

abstract class SongFirebaseService {
  Future<Either<String, List<SongEntity>>> getSongs();
  Future<Either<String, List<SongEntity>>> getPlaylist();
  Future<Either> toggleFavoriteSong(String songId);
  Future<bool> isFavorite(String songId);
  Future<Either> getUserFavoriteSongs();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either<String, List<SongEntity>>> getSongs() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection(kSongsCollection)
          .orderBy('releaseDate', descending: true)
          .limit(3)
          .get();
      for (var song in data.docs) {
        final songId = song.reference.id;
        var songModel = SongModel.fromJson(song.data());

        bool isFavorite =
            await sl<IsSongFavoriteUsecase>().call(params: songId);
        songModel.songId = songId;
        songModel.isFavorite = isFavorite;
        songs.add(songModel.toSongEntity());
      }
      return right(songs);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<SongEntity>>> getPlaylist() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection(kSongsCollection)
          .orderBy('releaseDate', descending: true)
          .get();
      for (var song in data.docs) {
        final songId = song.reference.id;
        var songModel = SongModel.fromJson(song.data());

        bool isFavorite =
            await sl<IsSongFavoriteUsecase>().call(params: songId);
        songModel.isFavorite = isFavorite;
        songModel.songId = songId;
        songs.add(songModel.toSongEntity());
      }
      return right(songs);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either> toggleFavoriteSong(String songId) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      late bool isFavorite;
      var user = auth.currentUser!;
      String uID = user.uid;
      QuerySnapshot fav = await firebaseFirestore
          .collection(kUsersCollection)
          .doc(uID)
          .collection(kfavoritesCollection)
          .where('songId', isEqualTo: songId)
          .get();
      if (fav.docs.isNotEmpty) {
        await fav.docs.first.reference.delete();
        isFavorite = false;
      } else {
        await firebaseFirestore
            .collection(kUsersCollection)
            .doc(uID)
            .collection(kfavoritesCollection)
            .add({
          'songId': songId,
          'addedDate': Timestamp.now(),
        });
        isFavorite = true;
      }
      return right(isFavorite);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<bool> isFavorite(String songId) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      var user = auth.currentUser!;
      String uID = user.uid;
      QuerySnapshot fav = await firebaseFirestore
          .collection(kUsersCollection)
          .doc(uID)
          .collection(kfavoritesCollection)
          .where('songId', isEqualTo: songId)
          .get();

      return fav.docs.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Either> getUserFavoriteSongs() async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      var user = auth.currentUser!;
      List<SongEntity> favSongs = [];
      String uid = user.uid;
      QuerySnapshot favSnapshot = await firestore
          .collection(kUsersCollection)
          .doc(uid)
          .collection(kfavoritesCollection)
          .get();
      for (var element in favSnapshot.docs) {
        String songId = element['songId'];
        var song =
            await firestore.collection(kSongsCollection).doc(songId).get();
        SongModel songModel = SongModel.fromJson(song.data()!);
        songModel.songId = songId;
        favSongs.add(songModel.toSongEntity());
      }
      return right(favSongs);
    } catch (e) {
      return left(e.toString());
    }
  }
}
