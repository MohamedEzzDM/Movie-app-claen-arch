import 'package:movies_app_clean/data/modules/movie_model.dart';
import 'package:movies_app_clean/domain/entity/result.dart';

class ResultModel extends Result {

  const ResultModel({
    required int page,
    required List<MovieModel> moviesResult,
    required int totalPages,
    required int totalResult,
  }) : super(
    moviesResult: moviesResult ,
          page: page,
          totalPages: totalPages,
          totalResult: totalResult,
        );

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
        page: json['page'],
        moviesResult: List<MovieModel>.from(
          json['results'].map(
            (movie) {
              return MovieModel.fromJson(movie);
            },
          ),
        ),


        totalPages: json['total_pages'],
        totalResult: json['total_results']);
  }
}

/* List<MovieModel> _getMovieResult(Map<String, dynamic> json) {

  List<MovieModel> finalResult = [];
  json['results'].forEach((movie) {
    finalResult.add(MovieModel.fromJson(movie));
  });
  return finalResult;
}
*/
