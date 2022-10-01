import 'package:movies_app_clean/domain/entity/movie_team.dart';

import 'character_module.dart';

class MovieTeamModule extends MovieTeam {
  const MovieTeamModule({
    required cast,
    required crew,
    required movieId,
  }) : super(
          cast: cast,
          crew: crew,
          movieId: movieId,
        );

  factory MovieTeamModule.fromJson(Map<String, dynamic> json) {
    return MovieTeamModule(
      cast: List<CharacterModule>.from(json['cast'].map((character){return CharacterModule.fromJson(character);})),
      crew: List<CharacterModule>.from(json['crew'].map((character){return CharacterModule.fromJson(character);})),
      movieId: json['id'],
    );
  }
}
