import 'package:flutter/material.dart';

class ResultTitle extends StatelessWidget {
  const ResultTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        'Your Result',
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: Colors.red,
            ),
      ),
    );
  }
}
