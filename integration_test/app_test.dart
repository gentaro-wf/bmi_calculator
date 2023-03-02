
import 'package:bmi_calculator/src/screens/widgets/custom_button.dart';
import 'package:bmi_calculator/src/screens/widgets/gender_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:bmi_calculator/main.dart' as app_main;

void main() {
  const maleKey = Key('male_button');
  const femaleKey = Key('female_button');
  const weightPlusKey = Key('weight_plus');
  const agePlusKey = Key('age_plus');

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('bmi calculate', (tester) async {
      // initialize
      app_main.main();
      await tester.pumpAndSettle();

      // gender
      final maleButton = tester.widget<GenderButton>(find.byKey(maleKey));
      final femaleButton = tester.widget<GenderButton>(find.byKey(femaleKey));
      expect(maleButton.active, false);
      expect(femaleButton.active, false);

      await tester.tap(find.byKey(maleKey));
      await tester.pump();
      final tappedMaleButton = tester.widget<GenderButton>(find.byKey(maleKey));
      expect(tappedMaleButton.active, true);

      // weight
      expect(find.text('40'), findsOneWidget);
      await tester.tap(find.byKey(weightPlusKey));
      await tester.pump();
      expect(find.text('41'), findsOneWidget);

      // age
      expect(find.text('20'), findsOneWidget);
      await tester.tap(find.byKey(agePlusKey));
      await tester.pump();
      expect(find.text('21'), findsOneWidget);

      // calculate
      await tester.tap(find.byType(CalculateButton));
      await tester.pumpAndSettle();

      // result screen
      expect(find.text('18.2'), findsOneWidget);
      expect(find.text('痩せぎみ'), findsOneWidget);

      // re-calculate
      await tester.tap(find.byType(ReCalculateButton));
      await tester.pumpAndSettle();

      // calculate screen
      expect(find.byKey(maleKey), findsOneWidget);
    });
  });
}
