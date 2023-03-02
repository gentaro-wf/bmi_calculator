import 'package:bmi_calculator/src/screens/widgets/gender_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const maleKey = Key('male_button');
  const femaleKey = Key('female_button');

  testWidgets('性別ボタン - 初期値', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: GenderWidget(),
          ),
        ),
      ),
    );

    final maleButton = tester.widget<GenderButton>(find.byKey(maleKey));
    final femaleButton = tester.widget<GenderButton>(find.byKey(femaleKey));

    expect(maleButton.active, false);
    expect(femaleButton.active, false);
  });

  testWidgets('性別ボタン - maleボタンタップ', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: GenderWidget(),
          ),
        ),
      ),
    );

    await tester.tap(find.byKey(maleKey));
    await tester.pump();

    final maleButton = tester.widget<GenderButton>(find.byKey(maleKey));
    final femaleButton = tester.widget<GenderButton>(find.byKey(femaleKey));

    expect(maleButton.active, true);
    expect(femaleButton.active, false);
  });

  testWidgets('性別ボタン - femaleボタンタップ', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: GenderWidget(),
          ),
        ),
      ),
    );

    await tester.tap(find.byKey(femaleKey));
    await tester.pump();

    final maleButton = tester.widget<GenderButton>(find.byKey(maleKey));
    final femaleButton = tester.widget<GenderButton>(find.byKey(femaleKey));

    expect(maleButton.active, false);
    expect(femaleButton.active, true);
  });

  testWidgets('性別ボタン - maleタップ -> femaleタップ', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: GenderWidget(),
          ),
        ),
      ),
    );

    await tester.tap(find.byKey(maleKey));
    await tester.pump();

    await tester.tap(find.byKey(femaleKey));
    await tester.pump();

    final maleButton = tester.widget<GenderButton>(find.byKey(maleKey));
    final femaleButton = tester.widget<GenderButton>(find.byKey(femaleKey));

    expect(maleButton.active, false);
    expect(femaleButton.active, true);
  });

  testWidgets('性別ボタン - maleタップ -> femaleタップ -> maleタップ', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: GenderWidget(),
          ),
        ),
      ),
    );

    await tester.tap(find.byKey(maleKey));
    await tester.pump();

    await tester.tap(find.byKey(femaleKey));
    await tester.pump();

    await tester.tap(find.byKey(maleKey));
    await tester.pump();

    final maleButton = tester.widget<GenderButton>(find.byKey(maleKey));
    final femaleButton = tester.widget<GenderButton>(find.byKey(femaleKey));

    expect(maleButton.active, true);
    expect(femaleButton.active, false);
  });
}
