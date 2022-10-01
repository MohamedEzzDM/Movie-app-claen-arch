part of 'home_screen_cubit.dart';

@immutable
abstract class HomeScreenState extends Equatable {}

class HomeScreenInitial extends HomeScreenState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends HomeScreenState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends HomeScreenState {
   String error;

  ErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class LoadedState extends HomeScreenState {
  List<Movie> movies;
  LoadedState(this.movies);

  @override
  List<Object?> get props => [movies];
}
