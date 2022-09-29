import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String name;
  final String overview;
  final String backdropPath;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;

  const Movie({
    required this.id,
    required this.name,
    required this.overview,
    required this.backdropPath,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,}
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


/*
Map gg = {
  "adult": false,
  "backdrop_path": "/5GA3vV1aWWHTSDO5eno8V5zDo8r.jpg",
  "genre_ids": [27, 53],
  "id": 760161,
  "original_language": "en",
  "original_title": "Orphan: First Kill",
  "overview":
      "After escaping from an Estonian psychiatric facility, Leena Klammer travels to America by impersonating Esther, the missing daughter of a wealthy family. But when her mask starts to slip, she is put against a mother who will protect her family from the murderous “child” at any cost.",
  "popularity": 8792.868,
  "poster_path": "/wSqAXL1EHVJ3MOnJzMhUngc8gFs.jpg",
  "release_date": "2022-07-27",
  "title": "Orphan: First Kill",
  "video": false,
  "vote_average": 7,
  "vote_count": 718
};
 */
