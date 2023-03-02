import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bmi_calculator/src/constraints/constants.dart';
import 'package:bmi_calculator/src/screens/result_screen.dart';
import 'package:bmi_calculator/src/models/bmi_value_provider.dart';

class CalculateButton extends ConsumerWidget {
  const CalculateButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _CustomButton(
      key: const Key('calculate_button'),
      title: '計算',
      onTap: () {
        ref.read(genderStateProvider);
        if (ref.read(genderStateProvider) == Gender.unknown) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kActiveColor,
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '性別を選択してください',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
          );
          return;
        }

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ResultScreen(),
          ),
        );
      },
    );
  }
}

class ReCalculateButton extends StatelessWidget {
  const ReCalculateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return _CustomButton(
      key: const Key('re_calculate_button'),
      title: '再度計算',
      onTap: () => Navigator.of(context).pop(),
    );
  }
}

class _CustomButton extends ConsumerWidget {
  const _CustomButton({
    required Key key,
    required this.title,
    this.onTap,
  });

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Ink(
      height: 70.0,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: InkWell(
        key: key,
        onTap: onTap,
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}
