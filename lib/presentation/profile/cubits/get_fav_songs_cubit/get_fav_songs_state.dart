part of 'get_fav_songs_cubit.dart';

@immutable
sealed class GetFavSongsState {}

final class GetFavSongsInitial extends GetFavSongsState {}

final class GetFavSongsLoading extends GetFavSongsState {}

final class GetFavSongsSuccess extends GetFavSongsState {
  final List<SongEntity> songs;

  GetFavSongsSuccess(this.songs);
}

final class GetFavSongsError extends GetFavSongsState {
  final String errorMessage;

  GetFavSongsError(this.errorMessage);
}
