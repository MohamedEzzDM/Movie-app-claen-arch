import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String job;
  final String? profilePicturePath;

  const Character({
    required this.name,
    required this.id,
    required this.job,
    this.profilePicturePath
  });

  @override
  List<Object?> get props => [
        name,
        job,
        id,
      ];
}
