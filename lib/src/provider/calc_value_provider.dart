import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Gender {
  unknown,
  male,
  female,
}

final genderStateProvider = StateProvider<Gender>((_) => Gender.unknown);
final heightStateProvider = StateProvider<double>((_) => 150.0);
final weightStateProvider = StateProvider<int>((_) => 40);
final ageStateProvider = StateProvider<int>((_) => 20);
