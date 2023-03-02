import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Gender {
  unknown('未指定'),
  male('男性'),
  female('女性');

  final String displayName;

  const Gender(this.displayName);
}

class WeightNotifier extends Notifier<int> {
  @override
  int build() {
    return 40;
  }

  void increment() {
    if (state < 999) {
      state++;
    }
  }

  void decrement() {
    if (state > 1) {
      state--;
    }
  }
}

class AgeNotifier extends Notifier<int> {
  @override
  int build() {
    return 20;
  }

  void increment() {
    if (state < 150) {
      state++;
    }
  }

  void decrement() {
    if (state > 0) {
      state--;
    }
  }
}

final genderStateProvider = StateProvider<Gender>((_) => Gender.unknown);
final heightStateProvider = StateProvider<int>((_) => 150);
final weightStateProvider =
    NotifierProvider<WeightNotifier, int>(WeightNotifier.new);
final ageStateProvider = NotifierProvider<AgeNotifier, int>(AgeNotifier.new);
