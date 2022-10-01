
import 'package:dartz/dartz.dart';
import 'package:movies_app_clean/domain/entity/character.dart';


import '../../core/network/failure.dart';
import '../repository/base_movies_repository.dart';

class GetMovieTeamByIdUseCase{
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieTeamByIdUseCase(this.baseMoviesRepository);

  Future<Either<Failure,List<Character>>> execute(int movieId) async{
    return await baseMoviesRepository.getMovieTeamById(movieId);
  }
}