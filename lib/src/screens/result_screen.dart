import 'package:bmi_calculator/src/screens/widgets/result_view.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/src/screens/widgets/custom_button.dart';
import 'package:bmi_calculator/src/screens/widgets/result_title.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ResultTitle(),
              Expanded(
                child: ResultView(),
              ),
              SizedBox(height: 16.0),
              ReCalculateButton(),
            ],
          ),
        ),
      ),
    );
  }
}
