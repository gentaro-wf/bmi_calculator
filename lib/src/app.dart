import 'package:bmi_calculator/src/constraints/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/src/screens/calculate_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          background: Color(0xFF101428),
        ),
        scaffoldBackgroundColor: kDeActiveColor,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 72.0,
          ),
          labelLarge: TextStyle(
            color: Colors.grey,
            fontSize: 24.0,
          ),
        ),
        sliderTheme: SliderThemeData(
          activeTrackColor: Colors.white,
          inactiveTrackColor: Colors.grey.shade700,
          thumbColor: Colors.red,
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 16.0),
        ),
      ),
      home: const CalculateScreen(),
    );
  }
}
