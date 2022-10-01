import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movies_app_clean/domain/entity/character.dart';
import 'package:movies_app_clean/domain/entity/movie_details.dart';
import 'package:movies_app_clean/domain/usecase/get_movie_team_by_id.dart';

import '../../../core/network/failure.dart';

import '../../../domain/usecase/get_movie_details_by_id.dart';

part 'details_screen_state.dart';

class DetailsScreenCubit extends Cubit<DetailsScreenState> {
  DetailsScreenCubit(this.getMovieTeamByIdUseCase,this.getMovieDetailsByIdUseCase) : super(DetailsScreenInitial());

  List<Character> movieCharacters=[];
  MovieDetails movieDetails=const MovieDetails(id: 0, name: "name", overview: "overview", backdropPath: "/q8icPVro0MYLTXbttS1KMpdQntP.jpg", posterPath: "/q8icPVro0MYLTXbttS1KMpdQntP.jpg", releaseDate: "releaseDate", voteAverage: 5, revenue: 5, runTime: 5, status: "haha");

  void init(int id) async{

    await getMovieDetailsById(id);
    await getMovieTeamById( id);
    emit(AllLoadedState());

  }

  final GetMovieDetailsByIdUseCase getMovieDetailsByIdUseCase;
  final GetMovieTeamByIdUseCase getMovieTeamByIdUseCase;




  Future<MovieDetails> getMovieDetailsById(int id) async {
    emit(LoadingState());


    Either<Failure, MovieDetails> responseNow =
        await getMovieDetailsByIdUseCase.execute(id);
    responseNow.fold(
      (l) => emit(ErrorState(l.message)),
      (r) {
        movieDetails = r;
        emit(LoadedMovieDetailsState(movieDetails));
      },
    );
    return movieDetails;
  }

  Future<List<Character>> getMovieTeamById(int id) async {
    emit(LoadingState());


    Either<Failure, List<Character>> responseNow =
        await getMovieTeamByIdUseCase.execute(id);
    responseNow.fold(
      (l) => emit(ErrorState(l.message)),
      (r) {
        movieCharacters = r;
        emit(LoadedCharactersState(movieCharacters));
      },
    );
    return movieCharacters;
  }
}
