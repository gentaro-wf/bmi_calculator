import 'package:flutter/foundation.dart';

enum Gender {
  unknown,
  male,
  female,
}

@immutable
class Person {
  const Person({
    this.gender = Gender.unknown,
    this.height = 100.0,
    this.weight = 50,
    this.age = 20,
  });

  static int maxWeight = 999;
  static int minWeight = 1;
  static int maxAge = 150;
  static int minAge = 0;

  final Gender gender;
  final double height;
  final int weight;
  final int age;

  Person copyWith({
    Gender? gender,
    double? height,
    int? weight,
    int? age,
  }) {
    return Person(
      gender: gender ?? this.gender,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
    );
  }

  @override
  String toString() {
    return 'Person(gender: $gender, height: $height, weight: $weight, age: $age)';
  }

  @override
  bool operator ==(covariant Person other) {
    if (identical(this, other)) return true;

    return other.gender == gender &&
        other.height == height &&
        other.weight == weight &&
        other.age == age;
  }

  @override
  int get hashCode {
    return gender.hashCode ^ height.hashCode ^ weight.hashCode ^ age.hashCode;
  }
}
