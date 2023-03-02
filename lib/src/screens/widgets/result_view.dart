import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bmi_calculator/src/constraints/constants.dart';
import 'package:bmi_calculator/src/models/bmi_result.dart';
import 'package:bmi_calculator/src/models/bmi_value_provider.dart';

class ResultView extends ConsumerWidget {
  const ResultView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = ref.watch(heightStateProvider);
    final weight = ref.watch(weightStateProvider);
    final bmi = BmiResult(height: height, weight: weight);

    return Container(
      color: kActiveColor,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            bmi.message,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            bmi.result,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
