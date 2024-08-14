import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../domain/entities/home/song/song_entity.dart';
import '../../../../domain/use_cases/song/get_playlist_usecase.dart';

part 'get_playlist_state.dart';

class GetPlaylistCubit extends Cubit<GetPlaylistState> {
  GetPlaylistCubit() : super(GetPlaylistInitial());

  Future<void> getPlaylist() async {
    emit(GetPlaylistLoading());
    final result = await sl<GetPlaylistUsecase>().call();
    result.fold((error) {
      emit(GetPlaylistError(error));
    }, (songs) {
      emit(GetPlaylistSuccess(songs));
    });
  }
}
