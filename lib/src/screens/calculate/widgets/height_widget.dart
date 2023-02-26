import 'package:flutter/material.dart';
import 'package:bmi_calculator/src/constraints/constants.dart';
import 'package:bmi_calculator/src/utils/hardcode.dart';

class HeightWidget extends StatelessWidget {
  const HeightWidget({
    super.key,
    required this.height,
    this.onChanged,
  });

  final double height;
  final Function(double)? onChanged;

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
            'HEIGHT'.hardcode,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          RichText(
            text: TextSpan(
              text: height.toStringAsFixed(0),
              style: Theme.of(context).textTheme.bodyLarge,
              children: [
                TextSpan(
                  text: 'cm'.hardcode,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
          Slider(
            value: height,
            min: 50,
            max: 250,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
