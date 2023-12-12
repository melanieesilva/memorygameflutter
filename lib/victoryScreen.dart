// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:memory/common/constants/app_colors.dart';
import 'package:memory/onBoarding.dart';

class VictoryScreen extends StatefulWidget {
  const VictoryScreen({Key? key}) : super(key: key);

  @override
  _VictoryScreenState createState() => _VictoryScreenState();
}

class _VictoryScreenState extends State<VictoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
          Container(
              padding: EdgeInsets.all(24),
              child: Center(
                  child: Column(children: <Widget>[
                Container(
                  width: 217,
                  child: Text("Memory Game",
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "KronaOne",
                        color: Colors.white,
                        fontSize: 24,
                      )),
                ),
                Container(
                  padding: EdgeInsets.only(top: 100),
                  child: Center(
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/partyPopper.png'),
                          SizedBox(width: 8),
                          Text(
                            "The winner is...",
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                color: AppColors.subtitle,
                                fontSize: 20,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      Container(
                        child: Text("Maria",
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "KronaOne",
                                fontSize: 32)),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 32),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  padding: EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.inputBack,
                                  ),
                                  child: Row(
                                    children: [
                                      Text("Misses",
                                          style: TextStyle(
                                              color: AppColors.danger,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w500)),
                                      SizedBox(width: 12),
                                      Text("4",
                                          style: TextStyle(
                                              color: AppColors.danger,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w500))
                                    ],
                                  )),
                              SizedBox(width: 24),
                              Container(
                                  padding: EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.inputBack,
                                  ),
                                  child: Row(
                                    children: [
                                      Text("Hits",
                                          style: TextStyle(
                                              color: AppColors.success,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w500)),
                                      SizedBox(width: 12),
                                      Text("4",
                                          style: TextStyle(
                                              color: AppColors.success,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w500))
                                    ],
                                  ))
                            ]),
                      )
                    ]),
                  ),
                )
              ]))),
          Container(
            padding: EdgeInsets.only(bottom: 24, left: 24, right: 24),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OnBoarding()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.btnColor,
                padding: EdgeInsets.all(20),
              ),
              child: Text(
                "Novo Jogo",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ]));
  }
}
