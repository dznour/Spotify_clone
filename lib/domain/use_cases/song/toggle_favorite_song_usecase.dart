import 'package:dartz/dartz.dart';

import '../../../core/services/service_locator.dart';
import '../../../core/usecase/usecase.dart';
import '../../repository/home/song/song_repository.dart';

class ToggleFavoriteSongUsecase extends Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<SongRepository>().toggleFavoriteSong(params!);
  }
}
