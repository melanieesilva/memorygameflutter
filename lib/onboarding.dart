// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:memory/common/constants/app_colors.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              child: Column(children: <Widget>[
                Text(
                  "WELCOME TO THE",
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "KronaOne"
                  ),
                ),
                Text(
                  "MEMORY GAME",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontFamily: "KronaOne"
                  ),
                )
              ]),
              color: Colors.blue,
              width: double.infinity),
        ],
      ),
    );
  }
}
