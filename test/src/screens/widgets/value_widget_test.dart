import 'package:bmi_calculator/src/screens/widgets/value_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('体重', () {
    testWidgets('初期値', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: WeightWidget(),
            ),
          ),
        ),
      );

      expect(find.text('40'), findsOneWidget);
    });

    testWidgets('インクリメント', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: WeightWidget(),
            ),
          ),
        ),
      );

      expect(find.text('40'), findsOneWidget);

      final addIcon = find.byIcon(Icons.add);
      expect(addIcon, findsOneWidget);
      await tester.tap(addIcon);
      await tester.pump();

      expect(find.text('41'), findsOneWidget);
    });

    testWidgets('インクリメント x 10', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: WeightWidget(),
            ),
          ),
        ),
      );

      expect(find.text('40'), findsOneWidget);

      final addIcon = find.byIcon(Icons.add);
      expect(addIcon, findsOneWidget);
      for (var i = 0; i < 10; i++) {
        await tester.tap(addIcon);
      }
      await tester.pump();

      expect(find.text('50'), findsOneWidget);
    });

    testWidgets('デクリメント', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: WeightWidget(),
            ),
          ),
        ),
      );

      expect(find.text('40'), findsOneWidget);

      final minusIcon = find.byIcon(Icons.remove);
      expect(minusIcon, findsOneWidget);
      await tester.tap(minusIcon);
      await tester.pump();

      expect(find.text('39'), findsOneWidget);
    });

    testWidgets('デクリメント x 10', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: WeightWidget(),
            ),
          ),
        ),
      );

      expect(find.text('40'), findsOneWidget);

      final minusIcon = find.byIcon(Icons.remove);
      expect(minusIcon, findsOneWidget);
      for (var i = 0; i < 10; i++) {
        await tester.tap(minusIcon);
      }
      await tester.pump();

      expect(find.text('30'), findsOneWidget);
    });

    testWidgets('最大値 - 999', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: WeightWidget(),
            ),
          ),
        ),
      );

      expect(find.text('40'), findsOneWidget);

      final addIcon = find.byIcon(Icons.add);
      expect(addIcon, findsOneWidget);
      for (var i = 0; i < 1000; i++) {
        await tester.tap(addIcon);
      }
      await tester.pump();

      expect(find.text('999'), findsOneWidget);
    });

    testWidgets('最低値 - 1', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: WeightWidget(),
            ),
          ),
        ),
      );

      expect(find.text('40'), findsOneWidget);

      final minusIcon = find.byIcon(Icons.remove);
      expect(minusIcon, findsOneWidget);
      for (var i = 0; i < 100; i++) {
        await tester.tap(minusIcon);
      }
      await tester.pump();

      expect(find.text('1'), findsOneWidget);
    });
  });

  group('年齢', () {
    testWidgets('初期値', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: AgeWidget(),
            ),
          ),
        ),
      );

      expect(find.text('20'), findsOneWidget);
    });

    testWidgets('インクリメント', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: AgeWidget(),
            ),
          ),
        ),
      );

      expect(find.text('20'), findsOneWidget);

      final addIcon = find.byIcon(Icons.add);
      expect(addIcon, findsOneWidget);
      await tester.tap(addIcon);
      await tester.pump();

      expect(find.text('21'), findsOneWidget);
    });

    testWidgets('インクリメント x 10', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: AgeWidget(),
            ),
          ),
        ),
      );

      expect(find.text('20'), findsOneWidget);

      final addIcon = find.byIcon(Icons.add);
      expect(addIcon, findsOneWidget);
      for (var i = 0; i < 10; i++) {
        await tester.tap(addIcon);
      }
      await tester.pump();

      expect(find.text('30'), findsOneWidget);
    });

    testWidgets('デクリメント', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: AgeWidget(),
            ),
          ),
        ),
      );

      expect(find.text('20'), findsOneWidget);

      final minusIcon = find.byIcon(Icons.remove);
      expect(minusIcon, findsOneWidget);
      await tester.tap(minusIcon);
      await tester.pump();

      expect(find.text('19'), findsOneWidget);
    });

    testWidgets('デクリメント x 10', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: AgeWidget(),
            ),
          ),
        ),
      );

      expect(find.text('20'), findsOneWidget);

      final minusIcon = find.byIcon(Icons.remove);
      expect(minusIcon, findsOneWidget);
      for (var i = 0; i < 10; i++) {
        await tester.tap(minusIcon);
      }
      await tester.pump();

      expect(find.text('10'), findsOneWidget);
    });

    testWidgets('最大値 - 150', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: AgeWidget(),
            ),
          ),
        ),
      );

      expect(find.text('20'), findsOneWidget);

      final addIcon = find.byIcon(Icons.add);
      expect(addIcon, findsOneWidget);
      for (var i = 0; i < 200; i++) {
        await tester.tap(addIcon);
      }
      await tester.pump();

      expect(find.text('150'), findsOneWidget);
    });

    testWidgets('最低値 - 0', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: AgeWidget(),
            ),
          ),
        ),
      );

      expect(find.text('20'), findsOneWidget);

      final minusIcon = find.byIcon(Icons.remove);
      expect(minusIcon, findsOneWidget);
      for (var i = 0; i < 30; i++) {
        await tester.tap(minusIcon);
      }
      await tester.pump();

      expect(find.text('0'), findsOneWidget);
    });
  });
}
