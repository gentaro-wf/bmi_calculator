import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bmi_calculator/src/constraints/constants.dart';
import 'package:bmi_calculator/src/screens/result_screen.dart';
import 'package:bmi_calculator/src/utils/hardcode.dart';
import 'package:bmi_calculator/src/models/person_info.dart';

class CalculateButton extends ConsumerWidget {
  const CalculateButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _CustomButton(
      title: '計算'.hardcode,
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
                    '性別を選択してください'.hardcode,
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
      title: '再度計算'.hardcode,
      onTap: () => Navigator.of(context).pop(),
    );
  }
}

class _CustomButton extends ConsumerWidget {
  const _CustomButton({
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
