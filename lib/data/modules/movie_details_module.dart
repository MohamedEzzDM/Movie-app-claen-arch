import 'package:movies_app_clean/domain/entity/movie_details.dart';

class MovieDetailsModule extends MovieDetails {
  const MovieDetailsModule(
      {required id,
      required name,
      required overview,
      required backdropPath,
      required posterPath,
      required releaseDate,
      required voteAverage,
      required revenue,
      required runTime,
      required status})
      : super(
          id: id,
          name: name,
          overview: overview,
          backdropPath: backdropPath,
          posterPath: posterPath,
          releaseDate: releaseDate,
          voteAverage: voteAverage,
          revenue: revenue,
          runTime: runTime,
          status: status,
        );

  factory MovieDetailsModule.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModule(
      id: json['id'],
      name: json['original_title'],
      overview: json['overview'],
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      voteAverage: (json['vote_average']).toDouble(),
      revenue: (json['revenue']),
      runTime: json['runtime'],
      status: json['status'],
    );
  }
}
