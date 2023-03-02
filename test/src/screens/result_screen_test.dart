import 'package:bmi_calculator/src/screens/widgets/custom_button.dart';
import 'package:bmi_calculator/src/screens/widgets/result_title.dart';
import 'package:bmi_calculator/src/screens/widgets/result_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bmi_calculator/src/screens/result_screen.dart';

void main() {
  testWidgets('result screen 起動', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: ResultScreen(),
        ),
      ),
    );

    expect(find.byType(ResultTitle), findsOneWidget);
    expect(find.byType(ResultView), findsOneWidget);
    expect(find.byType(ReCalculateButton), findsOneWidget);

    expect(find.text('17.8'), findsOneWidget);
    expect(find.text('痩せぎみ'), findsOneWidget);
  });
}
