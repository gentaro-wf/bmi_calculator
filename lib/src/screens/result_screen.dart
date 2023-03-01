import 'package:bmi_calculator/src/screens/widgets/result_view.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/src/screens/widgets/custom_button.dart';
import 'package:bmi_calculator/src/screens/widgets/result_title.dart';
import 'package:bmi_calculator/src/utils/hardcode.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'.hardcode),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: orientation == Orientation.portrait
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ResultTitle(),
                    Expanded(
                      child: ResultView(),
                    ),
                    SizedBox(height: 16.0),
                    ReCalculateButton(),
                  ],
                )
              : Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: const [
                          ResultTitle(),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: ResultView(),
                          ),
                        ],
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
