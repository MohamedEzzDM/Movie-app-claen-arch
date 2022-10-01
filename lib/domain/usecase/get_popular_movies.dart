import 'package:dartz/dartz.dart';

import '../../core/network/failure.dart';
import '../entity/movie.dart';
import '../repository/base_movies_repository.dart';

class GetPopularMoviesUseCase{

  final BaseMoviesRepository baseMoviesRepository;


  GetPopularMoviesUseCase(this.baseMoviesRepository);

  Future<Either<Failure,List<Movie>>> execute(){
    return baseMoviesRepository.getPopularMovies();
  }

}