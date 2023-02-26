import 'package:flutter/material.dart';
import 'package:bmi_calculator/src/constraints/constants.dart';
import 'package:bmi_calculator/src/screens/result/result_screen.dart';
import 'package:bmi_calculator/src/models/person.dart';
import 'package:bmi_calculator/src/screens/calculate/widgets/gender_widget.dart';
import 'package:bmi_calculator/src/screens/calculate/widgets/height_widget.dart';
import 'package:bmi_calculator/src/screens/calculate/widgets/value_widget.dart';
import 'package:bmi_calculator/src/utils/hardcode.dart';

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({super.key});

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  Person person = const Person();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'.hardcode),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: GenderWidget(
                        gender: Gender.male,
                        icon: Icons.male,
                        active: person.gender == Gender.male,
                        onTap: () {
                          setState(() {
                            person = person.copyWith(
                              gender: Gender.male,
                            );
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: GenderWidget(
                        gender: Gender.female,
                        icon: Icons.female,
                        active: person.gender == Gender.female,
                        onTap: () {
                          setState(() {
                            person = person.copyWith(
                              gender: Gender.female,
                            );
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: HeightWidget(
                  height: person.height,
                  onChanged: (value) {
                    setState(() {
                      person = person.copyWith(
                        height: value,
                      );
                    });
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ValueWidget(
                        title: 'WEIGHT',
                        value: person.weight,
                        onAddTap: () {
                          if (person.weight < Person.maxWeight) {
                            setState(() {
                              person =
                                  person.copyWith(weight: person.weight + 1);
                            });
                          }
                        },
                        onMinusTap: () {
                          if (person.weight > Person.minWeight) {
                            setState(() {
                              person =
                                  person.copyWith(weight: person.weight - 1);
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: ValueWidget(
                        title: 'AGE',
                        value: person.age,
                        onAddTap: () {
                          if (person.age < Person.maxAge) {
                            setState(() {
                              person = person.copyWith(age: person.age + 1);
                            });
                          }
                        },
                        onMinusTap: () {
                          if (person.age > Person.minAge) {
                            setState(() {
                              person = person.copyWith(age: person.age - 1);
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Ink(
                height: 70.0,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    if (person.gender == Gender.unknown) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: kActiveColor,
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '性別を選択してください'.hardcode,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                              IconButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                },
                                icon: const Icon(Icons.close),
                              ),
                            ],
                          ),
                        ),
                      );
                      return;
                    }

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ResultScreen(person: person);
                        },
                      ),
                    );
                  },
                  child: Center(
                    child: Text(
                      'CALCULATE'.hardcode,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
