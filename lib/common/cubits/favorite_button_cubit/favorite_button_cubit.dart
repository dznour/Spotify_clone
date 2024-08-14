import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/services/service_locator.dart';
import '../../../domain/use_cases/song/toggle_favorite_song_usecase.dart';

part 'favorite_button_state.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  FavoriteButtonCubit() : super(FavoriteButtonInitial());

  Future<void> favoriteButtonUpdated(String songId) async {
    var result = await sl<ToggleFavoriteSongUsecase>().call(params: songId);
    result.fold((_) {}, (isFavorite) {
      emit(FavoriteButtonToggle(isFavorite));
    });
  }
}
