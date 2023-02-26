import 'package:flutter/material.dart';
import 'package:bmi_calculator/src/constraints/constants.dart';

class ValueWidget extends StatelessWidget {
  const ValueWidget({
    super.key,
    required this.title,
    required this.value,
    this.onAddTap,
    this.onMinusTap,
  });

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
