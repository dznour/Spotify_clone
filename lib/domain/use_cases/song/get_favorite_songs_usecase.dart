import 'package:dartz/dartz.dart';

import '../../../core/services/service_locator.dart';
import '../../../core/usecase/usecase.dart';
import '../../repository/home/song/song_repository.dart';

class GetFavoriteSongsUsecase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongRepository>().getUserFavoriteSongs();
  }
}
