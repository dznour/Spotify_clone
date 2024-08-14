import 'package:bloc/bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meta/meta.dart';

part 'song_player_state.dart';

class SongPlayerCubit extends Cubit<SongPlayerState> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration songDuration = Duration.zero;
  Duration songPostion = Duration.zero;
  SongPlayerCubit() : super(SongPlayerInitial()) {
    audioPlayer.positionStream.listen((position) {
      songPostion = position;
      _updateSongPlayer();
    });
    audioPlayer.durationStream.listen((duration) {
      songDuration = duration!;
    });
  }

  void _updateSongPlayer() {
    emit(SongPlayerChange());
  }

  Future<void> loadSong(String url) async {
    try {
      await audioPlayer.setUrl(url);
      emit(SongPlayerSuccess());
    } catch (e) {
      emit(SongPlayerError(e.toString()));
    }
  }

  void playOrPauseSong() {
    if (audioPlayer.playing) {
      audioPlayer.stop();
      //audioPlayer.pause();
    } else {
      audioPlayer.play();
    }
    emit(SongPlayerChange());
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}
