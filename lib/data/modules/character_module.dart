import 'package:movies_app_clean/domain/entity/character.dart';

class CharacterModule extends Character {
  const CharacterModule(
      {required name, required id, required job, profilePicturePath})
      : super(
            name: name,
            id: id,
            job: job,
            profilePicturePath: profilePicturePath);

  factory CharacterModule.fromJson(Map<String, dynamic> json) {
    return CharacterModule(
        id: json['id'],
        name: json['name'],
        job: json['known_for_department'],
        profilePicturePath: json['profile_path'] ?? "/h120ebuCOk8aIlFYYGuW0eoDzWy.jpg"
    );
  }
}
