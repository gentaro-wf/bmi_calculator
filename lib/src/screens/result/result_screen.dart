import 'package:bmi_calculator/src/models/person.dart';
import 'package:bmi_calculator/src/utils/hardcode.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.person,
  });

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'.hardcode),
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
