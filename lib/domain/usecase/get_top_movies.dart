import 'package:dartz/dartz.dart';

import '../../core/network/failure.dart';
import '../entity/movie.dart';
import '../repository/base_movies_repository.dart';

class GetTopMoviesUseCase{

  final BaseMoviesRepository baseMoviesRepository;


  GetTopMoviesUseCase(this.baseMoviesRepository);

  Future<Either<Failure,List<Movie>>> execute(){
    return baseMoviesRepository.getTopMovies();
  }

}