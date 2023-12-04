import 'package:flutter/material.dart';
import 'package:memory/common/constants/app_colors.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text(
            "Texto 3",
            textDirection: TextDirection.ltr,
          ),
          Text(
            "Texto 2",
            textDirection: TextDirection.ltr,
          )
        ],
      ),
    );

    // Container(
    //   decoration: const BoxDecoration(
    //     color: AppColors.background
    //   ),
    //   child: const Center(
    //     child: Text(
    //       "Memory Game",
    //       textDirection: TextDirection.ltr,
    //       textAlign: TextAlign.center,
    //       style: TextStyle(
    //         color: Colors.white,
    //         fontSize: 36,
    //         fontFamily:'KronaOne',
    //         fontWeight: FontWeight.w400,
    //         height: 0,
    //       ),
    //     ),
    //   ),
    // );
  }
}