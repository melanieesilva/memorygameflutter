// ignore_for_file: prefer_const_constructors, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:memory/common/constants/app_colors.dart';

class GameScreen extends StatefulWidget {
  final List<String> playerNames;
  const GameScreen({Key? key, required this.playerNames}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Text("Player Names: ${widget.playerNames.join(', ')}",textDirection: TextDirection.ltr,style: TextStyle(
        //   color: Colors.white
        // ),),
        Container(
          child: Text("Header",textDirection: TextDirection.ltr,),
          color: Colors.white
        ),
        Container(
          child: Text("Área cartas",textDirection: TextDirection.ltr),
          color: Colors.white,
        ),
        Container(
          child: Text("Área navbar",textDirection: TextDirection.ltr),
          color: Colors.white,
        )
        // Image.asset('assets/img/cherry_blossom.png')
      ],
    ));
  }
}
