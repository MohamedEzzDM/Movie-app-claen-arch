
import 'package:movies_app_clean/domain/entity/movie.dart';

abstract class BaseMoviesRepository{
  Future<List<Movie>> getNowPlayingMovies();
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopMovies();
}