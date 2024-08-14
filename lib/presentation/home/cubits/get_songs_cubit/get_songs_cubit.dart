import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../domain/entities/home/song/song_entity.dart';
import '../../../../domain/use_cases/song/get_songs_usecase.dart';

part 'get_songs_state.dart';

class GetSongsCubit extends Cubit<GetSongsState> {
  GetSongsCubit() : super(GetSongsInitial());

  Future<void> getSongs() async {
    emit(GetSongsLoading());
    final result = await sl<GetSongsUsecase>().call();
    result.fold((error) {
      emit(GetSongsError(error));
    }, (songs) {
      emit(GetSongsSuccess(songs));
    });
  }
}
