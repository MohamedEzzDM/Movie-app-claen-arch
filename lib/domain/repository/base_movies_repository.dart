import 'package:dartz/dartz.dart';

import 'package:movies_app_clean/domain/entity/character.dart';
import 'package:movies_app_clean/domain/entity/movie.dart';
import 'package:movies_app_clean/domain/entity/movie_details.dart';

import '../../core/network/failure.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopMovies();

  Future<Either<Failure, MovieDetails>> getMovieDetailsById(int movieId);
  Future<Either<Failure, List<Character>>> getMovieTeamById(int movieId);
}
