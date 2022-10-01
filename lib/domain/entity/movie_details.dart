import 'package:equatable/equatable.dart';

class MovieDetails extends Equatable {
  final int id;
  final String name;
  final String overview;
  final String backdropPath;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;

  final int revenue;
  final int runTime;
  final String status;

  const MovieDetails({
     required this.id,
    required this.name,
    required this.overview,
    required this.backdropPath,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.revenue,
    required this.runTime,
    required this.status
  }
      );

  @override
  List<Object> get props => [
    id,
    name,
    overview,
    backdropPath,
    posterPath,
    releaseDate,
    voteAverage,
  ];
}
