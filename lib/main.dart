// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:memory/common/constants/app_colors.dart';
import 'package:memory/onboarding.dart';
import 'package:memory/victoryScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.background),
      home: VictoryScreen(),
    );
  }
}
