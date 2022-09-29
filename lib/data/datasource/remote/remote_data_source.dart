
import 'package:dio/dio.dart';
import 'package:movies_app_clean/core/utils/constant.dart';
import 'package:movies_app_clean/data/modules/result.dart';

import '../../../domain/entity/movie.dart';

abstract class BaseRemoteDataSource{
  
  Future<List<Movie>> getNowPlayingMovies();
  Future<List<Movie>> getTopMovies();
  Future<List<Movie>> getPopularMovies();
  
}

class RemoteDataSource extends BaseRemoteDataSource{
  
  Dio client = Dio();

  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    Response response = await client.get(ApiConstant.nowPlayingMoviesUrl);
    ResultModel receivedData = ResultModel.fromJson(response.data);

    return receivedData.moviesResult;
  }

  @override
  Future<List<Movie>> getPopularMovies() async{
    Response response = await client.get(ApiConstant.nowPopularMoviesUrl);
    ResultModel receivedData = ResultModel.fromJson(response.data);

    return receivedData.moviesResult;
  }

  @override
  Future<List<Movie>> getTopMovies() async {
    Response response = await client.get(ApiConstant.topMoviesUrl);
    ResultModel receivedData = ResultModel.fromJson(response.data);

    return receivedData.moviesResult;
  }


}