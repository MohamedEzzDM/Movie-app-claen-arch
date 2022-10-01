import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movies_app_clean/domain/usecase/get_top_movies.dart';

import '../../../core/network/failure.dart';

import '../../../data/datasource/remote/remote_data_source.dart';
import '../../../data/repository/movies_repository.dart';
import '../../../domain/entity/movie.dart';
import '../../../domain/repository/base_movies_repository.dart';
import '../../../domain/usecase/get_now_playing_movies.dart';
import '../../../domain/usecase/get_popular_movies.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());


  late List<Movie> nowPlayingMovies;
  late List<Movie> topRatedMovies;
  late List<Movie> popularMovies;

  void init() async{

    await getNowPlayingMovies();
    await getPopularMovies();
    await getTopRatedMovies();
  }


  Future<List<Movie>> getNowPlayingMovies() async {
    emit(LoadingState());
    BaseRemoteDataSource baseRemoteDataSource = RemoteDataSource();
    BaseMoviesRepository baseMoviesRepository = MoviesRepository(
        baseRemoteDataSource);

    Either<Failure, List<Movie>> responseNow =
    await GetNowPlayingMoviesUseCase(baseMoviesRepository)
        .execute();
    responseNow.fold(
          (l) => emit(ErrorState(l.message)),
          (r){ nowPlayingMovies = r;
            emit(LoadedState(r));

          },

    );
    return nowPlayingMovies;

  }


  Future<List<Movie>> getTopRatedMovies() async {
    emit(LoadingState());
    BaseRemoteDataSource baseRemoteDataSource = RemoteDataSource();
    BaseMoviesRepository baseMoviesRepository = MoviesRepository(
        baseRemoteDataSource);

    Either<Failure, List<Movie>> responseNow =
    await GetTopMoviesUseCase(baseMoviesRepository)
        .execute();
    responseNow.fold(
          (l) => emit(ErrorState(l.message)),
          (r){ topRatedMovies = r;
      emit(LoadedState(r));
      },
    );
    return topRatedMovies;
  }

  Future<List<Movie>> getPopularMovies() async {
    emit(LoadingState());
    BaseRemoteDataSource baseRemoteDataSource = RemoteDataSource();
    BaseMoviesRepository baseMoviesRepository = MoviesRepository(
        baseRemoteDataSource);

    Either<Failure, List<Movie>> responseNow =
    await GetPopularMoviesUseCase(baseMoviesRepository)
        .execute();
    responseNow.fold(
          (l) => emit(ErrorState(l.message)),
          (r){ popularMovies = r;
      emit(LoadedState(r));
      },
    );
    return popularMovies;
  }

}