import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Gender {
  unknown('未指定'),
  male('男性'),
  female('女性');

  final String displayName;

  const Gender(this.displayName);
}

final genderStateProvider = StateProvider<Gender>((_) => Gender.unknown);
final heightStateProvider = StateProvider<int>((_) => 150);
final weightStateProvider = StateProvider<int>((_) => 40);
final ageStateProvider = StateProvider<int>((_) => 20);
