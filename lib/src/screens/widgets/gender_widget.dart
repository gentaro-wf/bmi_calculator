import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bmi_calculator/src/constraints/constants.dart';
import 'package:bmi_calculator/src/models/person_info.dart';

class GenderWidget extends ConsumerWidget {
  const GenderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gender = ref.watch(genderStateProvider);

    return Row(
      children: [
        Expanded(
          child: _GenderButton(
            key: const Key('male_button'),
            gender: Gender.male,
            icon: Icons.male,
            active: gender == Gender.male,
            onTap: () {
              ref.read(genderStateProvider.notifier).state = Gender.male;
            },
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: _GenderButton(
            key: const Key('female_button'),
            gender: Gender.female,
            icon: Icons.female,
            active: gender == Gender.female,
            onTap: () {
              ref.read(genderStateProvider.notifier).state = Gender.female;
            },
          ),
        ),
      ],
    );
  }
}

class _GenderButton extends StatelessWidget {
  const _GenderButton({
    required Key key,
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
        key: key,
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
              gender.displayName,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
