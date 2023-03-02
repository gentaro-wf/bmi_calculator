import 'package:bmi_calculator/src/models/bmi_result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BMI 結果 痩せすぎ', () {
    testWidgets('BMI 14.7', (tester) async {
      final bmi = BmiResult(
        height: 165,
        weight: 40,
      );

      expect(bmi.result, '14.7');
      expect(bmi.message, '痩せすぎ');
    });

    testWidgets('BMI 15.9', (tester) async {
      final bmi = BmiResult(
        height: 170,
        weight: 46,
      );

      expect(bmi.result, '15.9');
      expect(bmi.message, '痩せすぎ');
    });
  });

  group('BMI 結果 痩せ', () {
    testWidgets('BMI 16.0', (tester) async {
      final bmi = BmiResult(
        height: 162,
        weight: 42,
      );

      expect(bmi.result, '16.0');
      expect(bmi.message, '痩せ');
    });

    testWidgets('BMI 16.9', (tester) async {
      final bmi = BmiResult(
        height: 150,
        weight: 38,
      );

      expect(bmi.result, '16.9');
      expect(bmi.message, '痩せ');
    });
  });

  group('BMI 結果 痩せぎみ', () {
    test('BMI 17.0', () {
      final bmi = BmiResult(
        height: 173,
        weight: 51,
      );

      expect(bmi.result, '17.0');
      expect(bmi.message, '痩せぎみ');
    });

    test('BMI 18.4', () {
      final bmi = BmiResult(
        height: 168,
        weight: 52,
      );

      expect(bmi.result, '18.4');
      expect(bmi.message, '痩せぎみ');
    });
  });

  group('BMI 結果 標準体重', () {
    test('BMI 18.5', () {
      final bmi = BmiResult(
        height: 171,
        weight: 54,
      );

      expect(bmi.result, '18.5');
      expect(bmi.message, '標準体重');
    });

    test('BMI 24.9', () {
      final bmi = BmiResult(
        height: 170,
        weight: 72,
      );

      expect(bmi.result, '24.9');
      expect(bmi.message, '標準体重');
    });
  });

  group('BMI 結果 肥満予備軍', () {
    test('BMI 25.0', () {
      final bmi = BmiResult(
        height: 171,
        weight: 73,
      );

      expect(bmi.result, '25.0');
      expect(bmi.message, '肥満予備軍');
    });

    test('BMI 29.9', () {
      final bmi = BmiResult(
        height: 180,
        weight: 97,
      );

      expect(bmi.result, '29.9');
      expect(bmi.message, '肥満予備軍');
    });
  });

  group('BMI 結果 肥満(1度)', () {
    test('BMI 30.0', () {
      final bmi = BmiResult(
        height: 155,
        weight: 72,
      );

      expect(bmi.result, '30.0');
      expect(bmi.message, '肥満(1度)');
    });

    test('BMI 34.9', () {
      final bmi = BmiResult(
        height: 156,
        weight: 85,
      );

      expect(bmi.result, '34.9');
      expect(bmi.message, '肥満(1度)');
    });

    group('BMI 結果 肥満(2度)', () {
      test('BMI 35.0', () {
        final bmi = BmiResult(
          height: 155,
          weight: 84,
        );

        expect(bmi.result, '35.0');
        expect(bmi.message, '肥満(2度)');
      });

      test('BMI 39.9', () {
        final bmi = BmiResult(
          height: 156,
          weight: 97,
        );

        expect(bmi.result, '39.9');
        expect(bmi.message, '肥満(2度)');
      });
    });

    group('BMI 結果 肥満(3度)', () {
      test('BMI 40.0', () {
        final bmi = BmiResult(
          height: 155,
          weight: 96,
        );

        expect(bmi.result, '40.0');
        expect(bmi.message, '肥満(3度)');
      });

      test('BMI 40.0', () {
        final bmi = BmiResult(
          height: 156,
          weight: 100,
        );

        expect(bmi.result, '41.1');
        expect(bmi.message, '肥満(3度)');
      });
    });
  });
}
