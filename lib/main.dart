import 'package:flutter/material.dart';
import 'package:memory/common/constants/app_colors.dart';
import 'package:memory/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: OnBoarding());
  }
}

