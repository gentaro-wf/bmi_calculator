import 'package:flutter/material.dart';
import 'package:bmi_calculator/src/screens/widgets/gender_widget.dart';
import 'package:bmi_calculator/src/screens/widgets/height_widget.dart';
import 'package:bmi_calculator/src/screens/widgets/value_widget.dart';
import 'package:bmi_calculator/src/screens/widgets/custom_button.dart';
import 'package:bmi_calculator/src/utils/hardcode.dart';

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({super.key});

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
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
            children: [
              Expanded(
                child: Row(
                  children: const [
                    Expanded(
                      child: MaleWidget(),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: FemaleWidget(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              const Expanded(
                child: HeightWidget(),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: Row(
                  children: const [
                    Expanded(
                      child: WeightWidget(),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: AgeWidget(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              const CalculateButton(),
            ],
          ),
        ),
      ),
    );
  }
}
