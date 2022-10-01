
import 'dart:ui';



class ApiConstants{
  static const String baseUrl='https://api.themoviedb.org/3';
  static const String appKey= "247a18e38e58225afffc980e1d8998e1";
  static const String baseImageUrl='https://image.tmdb.org/t/p/w500';

  // https://image.tmdb.org/t/p/w500/5GA3vV1aWWHTSDO5eno8V5zDo8r.jpg

  static const String nowPlayingMoviesUrl= "$baseUrl/movie/now_playing?api_key=$appKey&language=en-US&page=1";
  static const String topMoviesUrl=        "$baseUrl/movie/top_rated?api_key=$appKey&language=en-US&page=1";
  static const String popularMoviesUrl= "$baseUrl/movie/popular?api_key=$appKey&language=en-US&page=1";
  static String buildMovieDetailsUrlById(int movieId){
    return "$baseUrl/movie/$movieId?api_key=$appKey&language=en-US";
  }
  static String buildMovieTeamDetailsUrlById(int movieId){
    return "$baseUrl/movie/$movieId/credits?api_key=$appKey&language=en-US";
  }

//https://api.themoviedb.org/3/movie/111/credits?api_key=247a18e38e58225afffc980e1d8998e1&language=en-US

}
// https://api.themoviedb.org/3/movie/now_playing?api_key=247a18e38e58225afffc980e1d8998e1&language=en-US&page=1


class RoutesConstants{
  static const String homeScreen='/';
  static const String detailsScreen='/details_screen';

}

class ColorConstants {
  static const primary =  Color(0xFF1D1D27);
  static const amethystSmoke =  Color(0XFF9E9EBC);
  static const mandy = Color(0XFFE15050);
  static const martinique = Color(0XFF2D2D33);
}


