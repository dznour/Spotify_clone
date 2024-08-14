import 'package:dartz/dartz.dart';

import '../../../core/services/service_locator.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/home/song/song_entity.dart';
import '../../repository/home/song/song_repository.dart';

class GetSongsUsecase extends Usecase<Either, dynamic> {
  @override
  Future<Either<String, List<SongEntity>>> call({params}) async {
    return await sl<SongRepository>().getSongs();
  }
}
