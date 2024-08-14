import 'package:get_it/get_it.dart';

import '../../data/repository/auth/auth_repository_impl.dart';
import '../../data/repository/home/song/song_repository_impl.dart';
import '../../data/sources/auth/auth_firebase_service.dart';
import '../../data/sources/song/song_firebase_service.dart';
import '../../domain/repository/auth/auth_repository.dart';
import '../../domain/repository/home/song/song_repository.dart';
import '../../domain/use_cases/auth/get_user_usecase.dart';
import '../../domain/use_cases/auth/signin_usecase.dart';
import '../../domain/use_cases/auth/signup_usecase.dart';
import '../../domain/use_cases/song/get_favorite_songs_usecase.dart';
import '../../domain/use_cases/song/get_playlist_usecase.dart';
import '../../domain/use_cases/song/get_songs_usecase.dart';
import '../../domain/use_cases/song/is_song_favorite_usecase.dart';
import '../../domain/use_cases/song/toggle_favorite_song_usecase.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
  sl.registerSingleton<GetUserUsecase>(GetUserUsecase());
  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());
  sl.registerSingleton<SongRepository>(SongRepositoryImpl());
  sl.registerSingleton<GetSongsUsecase>(GetSongsUsecase());
  sl.registerSingleton<GetPlaylistUsecase>(GetPlaylistUsecase());
  sl.registerSingleton<IsSongFavoriteUsecase>(IsSongFavoriteUsecase());
  sl.registerSingleton<ToggleFavoriteSongUsecase>(ToggleFavoriteSongUsecase());
  sl.registerSingleton<GetFavoriteSongsUsecase>(GetFavoriteSongsUsecase());
}
