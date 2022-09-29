import 'package:dartz/dartz.dart';
import 'package:movies_app_clean/domain/entity/movie.dart';

import '../../core/network/failure.dart';
import '../repository/base_movies_repository.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  Future<Either<Failure,List<Movie>>> execute() async{
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
