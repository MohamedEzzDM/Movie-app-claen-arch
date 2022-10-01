import 'package:movies_app_clean/domain/entity/character.dart';

class MovieTeam {
  final int movieId;
  final List<Character> cast;
  final List<Character> crew;

  const MovieTeam({
    required this.cast,
    required this.crew,
    required this.movieId,
  });
}
