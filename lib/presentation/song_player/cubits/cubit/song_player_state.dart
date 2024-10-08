part of 'song_player_cubit.dart';

@immutable
sealed class SongPlayerState {}

final class SongPlayerInitial extends SongPlayerState {}

final class SongPlayerChange extends SongPlayerState {}

final class SongPlayerLoading extends SongPlayerState {}

final class SongPlayerSuccess extends SongPlayerState {}

final class SongPlayerError extends SongPlayerState {
  final String error;

  SongPlayerError(this.error);
}
