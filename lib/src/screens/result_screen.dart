import 'package:bmi_calculator/src/constraints/constants.dart';
import 'package:bmi_calculator/src/models/bmi_result.dart';
import 'package:bmi_calculator/src/models/person_info.dart';
import 'package:bmi_calculator/src/screens/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/src/utils/hardcode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = ref.watch(heightStateProvider);
    final weight = ref.watch(weightStateProvider);
    final bmi = BmiResult(height: height, weight: weight);

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'.hardcode),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: Text(
                  'Your Result'.hardcode,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Colors.red,
                      ),
                ),
              ),
              Expanded(
                child: Container(
                  color: kActiveColor,
                  child: Column(
                    children: [
                      Text(bmi.message),
                      Text(bmi.result),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const ReCalculateButton(),
            ],
          ),
        ),
      ),
    );
  }
}
