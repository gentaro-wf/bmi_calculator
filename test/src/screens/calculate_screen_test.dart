import 'package:bmi_calculator/src/screens/widgets/custom_button.dart';
import 'package:bmi_calculator/src/screens/widgets/gender_widget.dart';
import 'package:bmi_calculator/src/screens/widgets/height_widget.dart';
import 'package:bmi_calculator/src/screens/widgets/value_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bmi_calculator/src/screens/calculate_screen.dart';

void main() {
  testWidgets('calculate screen 起動のみ', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: CalculateScreen(),
        ),
      ),
    );

    expect(find.byType(GenderWidget), findsOneWidget);
    expect(find.byType(HeightWidget), findsOneWidget);
    expect(find.byType(WeightWidget), findsOneWidget);
    expect(find.byType(AgeWidget), findsOneWidget);
    expect(find.byType(CalculateButton), findsOneWidget);
  });

  testWidgets('性別未選択', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: CalculateScreen(),
        ),
      ),
    );

    await tester.tap(find.byType(CalculateButton));
    await tester.pump();
    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('性別を選択してください'), findsOneWidget);
  });
}
