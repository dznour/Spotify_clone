part of 'get_songs_cubit.dart';

@immutable
sealed class GetSongsState {}

final class GetSongsInitial extends GetSongsState {}

final class GetSongsLoading extends GetSongsState {}

final class GetSongsSuccess extends GetSongsState {
  final List<SongEntity> songs;

  GetSongsSuccess(this.songs);
}

final class GetSongsError extends GetSongsState {
  final String errorMessage;

  GetSongsError(this.errorMessage);
}
