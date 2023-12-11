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
        body: Column(children: <Widget>[
      Container(
          child: Center(
              child: Column(children: <Widget>[
        Container(
          child: Text("Memory Game",
              textDirection: TextDirection.ltr,
              style: TextStyle(fontFamily: "Krona One", color: Colors.white)),
        ),
        Container(
          child: Center(
            child: Column(children: [
              Row(
                children: [
                  Image.asset('assets/images/partyPopper.png'),
                  SizedBox(width: 8),
                  Text(
                    "The winner is...",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(color: AppColors.subtitle),
                  )
                ],
              ),
              Container(
                child: Text(
                  "Maria",
                  textDirection: TextDirection.ltr,
                ),
              ),
              Container(
                child: Row(children: [
                  Container(
                      child: Row(
                    children: [Text("Misses"), SizedBox(width: 12), Text("4")],
                  )),
                  Container(
                      child: Row(
                    children: [Text("Hits"), SizedBox(width: 12), Text("4")],
                  ))
                ]),
              )
            ]),
          ),
        )
      ]))),
      Container(
        child: Container(
          decoration: BoxDecoration(color: AppColors.btnColor),
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
