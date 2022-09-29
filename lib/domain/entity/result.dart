import 'package:equatable/equatable.dart';
import 'package:movies_app_clean/domain/entity/movie.dart';

class Result extends Equatable {
  final int page;
  final List<Movie> moviesResult;
  final int totalPages;
  final int totalResult;

  const Result(
      {
    required this.page,
    required this.moviesResult,
    required this.totalPages,
    required this.totalResult,
     }
  );

  @override
  List<Object?> get props => [
        page,
        moviesResult,
        totalPages,
        totalResult,
      ];
}
