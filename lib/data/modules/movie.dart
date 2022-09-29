import 'package:movies_app_clean/domain/entity/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required id,
    required name,
    required overview,
    required backdropPath,
    required posterPath,
    required releaseDate,
    required voteAverage,
  }) : super(
          id: id,
          name: name,
          overview: overview,
          backdropPath: backdropPath,
          posterPath: posterPath,
          releaseDate: releaseDate,
          voteAverage: voteAverage,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      name: json['original_title'],
      overview: json['overview'],
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      voteAverage: (json['vote_average']).toDouble(),
    );
  }
}
