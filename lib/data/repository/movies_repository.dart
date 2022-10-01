import 'package:dartz/dartz.dart';
import 'package:movies_app_clean/core/network/failure.dart';
import 'package:movies_app_clean/core/network/exceptions.dart';
import 'package:movies_app_clean/data/datasource/remote/remote_data_source.dart';


import 'package:movies_app_clean/domain/entity/movie.dart';

import 'package:movies_app_clean/domain/repository/base_movies_repository.dart';

import '../../domain/entity/character.dart';
import '../../domain/entity/movie_details.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseRemoteDataSource baseRemoteDataSource;
  MoviesRepository(this.baseRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async{

    try{
      List<Movie> movies = await baseRemoteDataSource.getNowPlayingMovies();
      return Right(movies);
    }on ServerException catch(e){

      return Left(Failure(message: e.errorMessage.statusMessage));

    }


  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try{
      List<Movie> movies = await baseRemoteDataSource.getPopularMovies();
      return Right(movies);
    }on ServerException catch(e){

      return Left(Failure(message: e.errorMessage.statusMessage));

    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopMovies() async {
    try{
      List<Movie> movies = await baseRemoteDataSource.getTopMovies();
      return Right(movies);
    }on ServerException catch(e){

      return Left(Failure(message: e.errorMessage.statusMessage));

    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetailsById(int movieId) async{
    try{
      MovieDetails movieDetails = await baseRemoteDataSource.getMovieDetailsById(movieId);
      return Right(movieDetails);
    }on ServerException catch(e){

      return Left(Failure(message: e.errorMessage.statusMessage));

    }
  }

  @override
  Future<Either<Failure, List<Character>>> getMovieTeamById(int movieId) async{
    try{
      List<Character> characters = await baseRemoteDataSource.getMovieTeamById(movieId);
      return Right(characters);
    }on ServerException catch(e){

      return Left(Failure(message: e.errorMessage.statusMessage));

    }
    
  }







}
