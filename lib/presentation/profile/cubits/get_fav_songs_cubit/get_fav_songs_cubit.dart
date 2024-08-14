import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../domain/entities/home/song/song_entity.dart';
import '../../../../domain/use_cases/song/get_favorite_songs_usecase.dart';

part 'get_fav_songs_state.dart';

class GetFavSongsCubit extends Cubit<GetFavSongsState> {
  GetFavSongsCubit() : super(GetFavSongsInitial());
  List<SongEntity> favoriteSongs = [];
  Future<void> getFavSongs() async {
    emit(GetFavSongsLoading());
    var result = await sl<GetFavoriteSongsUsecase>().call();
    result.fold((error) {
      emit(GetFavSongsError(error.toString()));
    }, (r) {
      favoriteSongs = r;
      emit(GetFavSongsSuccess(favoriteSongs));
    });
  }

  void removeSong(int index) {
    favoriteSongs.removeAt(index);
    emit(GetFavSongsSuccess(favoriteSongs));
  }
}
