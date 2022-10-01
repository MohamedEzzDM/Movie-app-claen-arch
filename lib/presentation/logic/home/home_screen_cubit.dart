import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movies_app_clean/domain/usecase/get_top_movies.dart';

import '../../../core/di/service_locator.dart';
import '../../../core/network/failure.dart';

import '../../../domain/entity/movie.dart';

import '../../../domain/usecase/get_now_playing_movies.dart';
import '../../../domain/usecase/get_popular_movies.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopMoviesUseCase,
  ) : super(HomeScreenInitial());

  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetTopMoviesUseCase getTopMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  late List<Movie> nowPlayingMovies;
  late List<Movie> topRatedMovies;
  late List<Movie> popularMovies;

  void init() async {
    await getNowPlayingMovies();
    await getPopularMovies();
    await getTopRatedMovies();
  }

  Future<List<Movie>> getNowPlayingMovies() async {
    emit(LoadingState());

    Either<Failure, List<Movie>> responseNow =
        await GetNowPlayingMoviesUseCase(sl()).execute();
    responseNow.fold(
      (l) => emit(ErrorState(l.message)),
      (r) {
        nowPlayingMovies = r;
        emit(LoadedState(r));
      },
    );
    return nowPlayingMovies;
  }

  Future<List<Movie>> getTopRatedMovies() async {
    emit(LoadingState());

    Either<Failure, List<Movie>> responseNow =
        await GetTopMoviesUseCase(sl()).execute();
    responseNow.fold(
      (l) => emit(ErrorState(l.message)),
      (r) {
        topRatedMovies = r;
        emit(LoadedState(r));
      },
    );
    return topRatedMovies;
  }

  Future<List<Movie>> getPopularMovies() async {
    emit(LoadingState());

    Either<Failure, List<Movie>> responseNow =
        await GetPopularMoviesUseCase(sl()).execute();
    responseNow.fold(
      (l) => emit(ErrorState(l.message)),
      (r) {
        popularMovies = r;
        emit(LoadedState(r));
      },
    );
    return popularMovies;
  }
}
