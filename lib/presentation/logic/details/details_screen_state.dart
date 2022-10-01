part of 'details_screen_cubit.dart';

@immutable
abstract class DetailsScreenState extends Equatable{}

class DetailsScreenInitial extends DetailsScreenState {

  @override
  List<Object?> get props => [];
}



class LoadingState extends DetailsScreenState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends DetailsScreenState {
  String error;

  ErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class LoadedMovieDetailsState extends DetailsScreenState {
  MovieDetails movieDetails;

  LoadedMovieDetailsState(this.movieDetails){
    print("done");
    print(movieDetails.name);
  }

  @override
  List<Object?> get props => [movieDetails];
}
class LoadedCharactersState extends DetailsScreenState {
  List<Character> characters;
  LoadedCharactersState(this.characters);

  @override
  List<Object?> get props => [characters];
}

class AllLoadedState extends DetailsScreenState {
  @override
  List<Object?> get props => [];
}