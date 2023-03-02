import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bmi_calculator/src/constraints/constants.dart';
import 'package:bmi_calculator/src/models/bmi_value_provider.dart';

class HeightWidget extends ConsumerWidget {
  const HeightWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = ref.watch(heightStateProvider);

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
            '身長',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          RichText(
            text: TextSpan(
              text: height.toStringAsFixed(0),
              style: Theme.of(context).textTheme.bodyLarge,
              children: [
                TextSpan(
                  text: 'cm',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
          Slider(
            value: height.toDouble(),
            min: 50,
            max: 250,
            onChanged: (value) {
              ref.read(heightStateProvider.notifier).state = value.toInt();
            },
          ),
        ],
      ),
    );
  }
}
