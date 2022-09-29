import 'package:movies_app_clean/domain/entity/movie.dart';

import '../repository/base_movies_repository.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  Future<List<Movie>> execute() async{
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
