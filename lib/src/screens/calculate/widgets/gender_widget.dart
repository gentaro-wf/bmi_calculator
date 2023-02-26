import 'package:flutter/material.dart';
import 'package:bmi_calculator/src/models/person.dart';
import 'package:bmi_calculator/src/constraints/constants.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({
    super.key,
    required this.gender,
    required this.icon,
    required this.active,
    this.onTap,
  });

  final Gender gender;
  final IconData icon;
  final bool active;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: active ? kActiveColor : kDeActiveColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 96.0,
            ),
            Text(
              gender.name.toUpperCase(),
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
