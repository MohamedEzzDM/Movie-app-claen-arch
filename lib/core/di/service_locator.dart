import 'package:get_it/get_it.dart';
import 'package:movies_app_clean/data/datasource/remote/remote_data_source.dart';
import 'package:movies_app_clean/data/repository/movies_repository.dart';
import 'package:movies_app_clean/domain/repository/base_movies_repository.dart';
import 'package:movies_app_clean/domain/usecase/get_movie_details_by_id.dart';
import 'package:movies_app_clean/domain/usecase/get_movie_team_by_id.dart';
import 'package:movies_app_clean/domain/usecase/get_now_playing_movies.dart';
import 'package:movies_app_clean/domain/usecase/get_popular_movies.dart';
import 'package:movies_app_clean/presentation/logic/home/home_screen_cubit.dart';

import '../../domain/usecase/get_top_movies.dart';
import '../../presentation/logic/details/details_screen_cubit.dart';

GetIt sl = GetIt.instance;


class ServiceLocator{

  void init(){

    //cubits
    sl.registerFactory(() => HomeScreenCubit(sl(),sl(),sl()));
    sl.registerFactory(() => DetailsScreenCubit(sl(),sl()));


    //UseCases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsByIdUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieTeamByIdUseCase(sl()));

    //Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() =>MoviesRepository(sl()));


    //Data source
    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
  }
}