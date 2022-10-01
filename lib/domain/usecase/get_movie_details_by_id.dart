import 'package:dartz/dartz.dart';
import 'package:movies_app_clean/domain/entity/movie_details.dart';

import '../../core/network/failure.dart';

import '../repository/base_movies_repository.dart';

class GetMovieDetailsByIdUseCase{
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsByIdUseCase(this.baseMoviesRepository);

  Future<Either<Failure,MovieDetails>> execute(int movieId) async{
    return await baseMoviesRepository.getMovieDetailsById(movieId);
  }
}