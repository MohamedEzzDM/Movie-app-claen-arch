
class ApiConstant{
  static const String baseUrl='https://api.themoviedb.org/3';
  static const String appKey= "247a18e38e58225afffc980e1d8998e1";

  static const String nowPlayingMoviesUrl= "$baseUrl/movie/now_playing?api_key=$appKey&language=en-US&page=1";
  static const String topMoviesUrl=        "$baseUrl/movie/popular?api_key=$appKey&language=en-US&page=1";
  static const String popularMoviesUrl= "$baseUrl/movie/top_rated?api_key=$appKey&language=en-US&page=1";
}
// https://api.themoviedb.org/3/movie/now_playing?api_key=247a18e38e58225afffc980e1d8998e1&language=en-US&page=1