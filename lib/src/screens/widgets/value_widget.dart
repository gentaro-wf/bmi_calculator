import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bmi_calculator/src/constraints/constants.dart';
import 'package:bmi_calculator/src/models/person_info.dart';

class WeightWidget extends ConsumerWidget {
  const WeightWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weight = ref.watch(weightStateProvider);

    return _ValueWidget(
      keyName: 'weight',
      title: '体重',
      value: weight,
      onAddTap: () => ref.read(weightStateProvider.notifier).state++,
      onMinusTap: () => ref.read(weightStateProvider.notifier).state--,
    );
  }
}

class AgeWidget extends ConsumerWidget {
  const AgeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final age = ref.watch(ageStateProvider);

    return _ValueWidget(
      keyName: 'age',
      title: '年齢',
      value: age,
      onAddTap: () => ref.read(ageStateProvider.notifier).state++,
      onMinusTap: () => ref.read(ageStateProvider.notifier).state--,
    );
  }
}

class _ValueWidget extends StatelessWidget {
  const _ValueWidget({
    required this.keyName,
    required this.title,
    required this.value,
    this.onAddTap,
    this.onMinusTap,
  });

  final String keyName;
  final String title;
  final int value;
  final VoidCallback? onAddTap;
  final VoidCallback? onMinusTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kActiveColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Text(
            '$value',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade700,
                radius: 32.0,
                child: IconButton(
                  key: Key('${keyName}_minus'),
                  onPressed: onMinusTap,
                  icon: const Icon(
                    Icons.remove,
                    size: 48.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              CircleAvatar(
                backgroundColor: Colors.grey.shade700,
                radius: 32.0,
                child: IconButton(
                  key: Key('${keyName}_plus'),
                  onPressed: onAddTap,
                  icon: const Icon(
                    Icons.add,
                    size: 48.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
