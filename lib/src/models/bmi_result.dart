import 'dart:math' as math;

class BmiResult {
  BmiResult({
    required int height,
    required int weight,
  }) {
    _calculate(
      height: height,
      weight: weight,
    );
  }

  double _bmi = 0.0;
  String _message = '';

  String get result => _bmi.toString();
  String get message => _message;

  void _calculate({
    required int height,
    required int weight,
  }) {
    _bmi =
        double.parse((weight / math.pow(height / 100, 2)).toStringAsFixed(1));
    if (_bmi < 16.0) {
      _message = '痩せすぎ';
    } else if (_bmi < 17.0) {
      _message = '痩せ';
    } else if (_bmi < 18.5) {
      _message = '痩せぎみ';
    } else if (_bmi < 25.0) {
      _message = '標準体重';
    } else if (_bmi < 30.0) {
      _message = '肥満予備軍';
    } else if (_bmi < 35.0) {
      _message = '肥満(1度)';
    } else if (_bmi < 40.0) {
      _message = '肥満(2度)';
    } else {
      _message = '肥満(3度)';
    }
  }
}
