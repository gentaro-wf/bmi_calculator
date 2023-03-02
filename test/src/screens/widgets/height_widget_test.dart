import 'package:bmi_calculator/src/screens/widgets/height_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('身長スライダー - 初期値', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: HeightWidget(),
          ),
        ),
      ),
    );

    expect(find.text('150cm', findRichText: true), findsOneWidget);
  });

  testWidgets('身長スライダー - 最小値', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: HeightWidget(),
          ),
        ),
      ),
    );

    await tester.drag(find.byType(Slider), const Offset(-500.0, 0.0));
    await tester.pump();
    expect(find.text('50cm', findRichText: true), findsOneWidget);
  });

  testWidgets('身長スライダー - 最大値', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: HeightWidget(),
          ),
        ),
      ),
    );

    await tester.drag(find.byType(Slider), const Offset(500.0, 0.0));
    await tester.pump();
    expect(find.text('250cm', findRichText: true), findsOneWidget);
  });
}
