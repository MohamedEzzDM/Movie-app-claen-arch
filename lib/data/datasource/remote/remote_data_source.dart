import 'package:dio/dio.dart';
import 'package:movies_app_clean/core/network/error_response_model.dart';
import 'package:movies_app_clean/core/utils/constant.dart';
import 'package:movies_app_clean/data/modules/result_model.dart';

import '../../../core/network/exceptions.dart';
import '../../../domain/entity/movie.dart';

abstract class BaseRemoteDataSource {
  Future<List<Movie>> getNowPlayingMovies();
  Future<List<Movie>> getTopMovies();
  Future<List<Movie>> getPopularMovies();
}

class RemoteDataSource extends BaseRemoteDataSource {
  Dio client = Dio();

  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    Response response = await client.get(ApiConstant.nowPlayingMoviesUrl);
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
    Response response = await client.get(ApiConstant.popularMoviesUrl);
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
    Response response = await client.get(ApiConstant.topMoviesUrl);
    if (response.statusCode == 200) {
      ResultModel receivedData = ResultModel.fromJson(response.data);
      return receivedData.moviesResult;
    } else {
      throw ServerException(
          errorMessage: ErrorResponseModel.fromJson(response.data));
    }
  }
}
