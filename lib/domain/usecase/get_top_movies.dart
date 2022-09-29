import '../repository/base_movies_repository.dart';

class GetTopMoviesUseCase{

  final BaseMoviesRepository baseMoviesRepository;


  GetTopMoviesUseCase(this.baseMoviesRepository);

  execute(){
    return baseMoviesRepository.getNowPlayingMovies();
  }

}