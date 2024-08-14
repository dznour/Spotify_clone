import '../../../core/services/service_locator.dart';
import '../../../core/usecase/usecase.dart';
import '../../repository/home/song/song_repository.dart';

class IsSongFavoriteUsecase extends Usecase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return await sl<SongRepository>().isFavorite(params!);
  }
}
