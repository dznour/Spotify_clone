part of 'favorite_button_cubit.dart';

@immutable
sealed class FavoriteButtonState {}

final class FavoriteButtonInitial extends FavoriteButtonState {}

final class FavoriteButtonToggle extends FavoriteButtonState {
  final bool isFavorite;

  FavoriteButtonToggle(this.isFavorite);
}
