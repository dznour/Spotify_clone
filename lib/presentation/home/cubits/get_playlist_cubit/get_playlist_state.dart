part of 'get_playlist_cubit.dart';

@immutable
sealed class GetPlaylistState {}

final class GetPlaylistInitial extends GetPlaylistState {}

final class GetPlaylistLoading extends GetPlaylistState {}

final class GetPlaylistSuccess extends GetPlaylistState {
  final List<SongEntity> songs;

  GetPlaylistSuccess(this.songs);
}

final class GetPlaylistError extends GetPlaylistState {
  final String error;

  GetPlaylistError(this.error);
}
