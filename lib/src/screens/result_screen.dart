import 'package:bmi_calculator/src/constraints/constants.dart';
import 'package:bmi_calculator/src/screens/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/src/utils/hardcode.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
