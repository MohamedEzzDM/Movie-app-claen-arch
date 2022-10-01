import 'package:dio/dio.dart';
import 'package:movies_app_clean/core/network/error_response_model.dart';
import 'package:movies_app_clean/core/utils/constant.dart';
import 'package:movies_app_clean/data/modules/movie_details_module.dart';
import 'package:movies_app_clean/data/modules/movie_team_module.dart';
import 'package:movies_app_clean/data/modules/result_model.dart';
import 'package:movies_app_clean/domain/entity/character.dart';

import '../../../core/network/exceptions.dart';
import '../../../domain/entity/movie.dart';

abstract class BaseRemoteDataSource {
  Future<List<Movie>> getNowPlayingMovies();
  Future<List<Movie>> getTopMovies();
  Future<List<Movie>> getPopularMovies();

  Future<MovieDetailsModule> getMovieDetailsById(int movieId);
  Future<List<Character>> getMovieTeamById(int movieId);
}

class RemoteDataSource extends BaseRemoteDataSource {
  Dio client = Dio();

  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    Response response = await client.get(ApiConstants.nowPlayingMoviesUrl);
    if (response.statusCode == 200) {
      ResultModel receivedData = ResultModel.fromJson(response.data);

      return receivedData.moviesResult;
    } else {
      throw ServerException(
          errorMessage: ErrorResponseModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Movie>> getPopularMovies() async {
    Response response = await client.get(ApiConstants.popularMoviesUrl);
    if (response.statusCode == 200) {
      ResultModel receivedData = ResultModel.fromJson(response.data);
      return receivedData.moviesResult;
    } else {
      throw ServerException(
          errorMessage: ErrorResponseModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Movie>> getTopMovies() async {
    Response response = await client.get(ApiConstants.topMoviesUrl);
    if (response.statusCode == 200) {
      ResultModel receivedData = ResultModel.fromJson(response.data);
      return receivedData.moviesResult;
    } else {
      throw ServerException(
          errorMessage: ErrorResponseModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModule> getMovieDetailsById(int movieId) async {
    Response response =
        await client.get(ApiConstants.buildMovieDetailsUrlById(movieId));
    if (response.statusCode == 200) {
      MovieDetailsModule receivedData =
          MovieDetailsModule.fromJson(response.data);

      return receivedData;
    } else {
      throw ServerException(
          errorMessage: ErrorResponseModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Character>> getMovieTeamById(int movieId) async {
    Response response =
        await client.get(ApiConstants.buildMovieTeamDetailsUrlById(movieId));
    if (response.statusCode == 200) {
      MovieTeamModule receivedData = MovieTeamModule.fromJson(response.data);
      return receivedData.cast;
    } else {
      throw ServerException(
          errorMessage: ErrorResponseModel.fromJson(response.data));
    }
  }
}
