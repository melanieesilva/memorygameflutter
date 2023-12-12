// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:memory/onboarding.dart';
import 'package:memory/common/constants/app_colors.dart';

class VictoryScreen extends StatelessWidget {
  final String winnerName;
  final List<Map<String, int>> playerStats;
  final Map<String, int> winnerStats;
  final List<String> playerNames;

  const VictoryScreen({
    Key? key,
    required this.winnerName,
    required this.playerStats,
    required this.winnerStats, // Certifique-se de incluir winnerStats no construtor
    required this.playerNames,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int winnerIndex = playerNames.indexOf(winnerName);
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
                        child: Text(winnerName,
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
                                      Text("Misses  ",
                                          style: TextStyle(
                                              color: AppColors.danger,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w500)),
                                      SizedBox(width: 12),
                                      Text("${playerStats[winnerIndex]['misses']}",
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
                                      Text("${playerStats[winnerIndex]['hits']}",
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

//TELA ANTIGA

    //   body: Center(
    //     // Adicionando o Center para centralizar verticalmente
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: <Widget>[
    //         Text(
    //           'The winner is:',
    //           style: TextStyle(
    //               fontSize: 24,
    //               fontWeight: FontWeight.bold,
    //               color: Colors.white),
    //         ),
    //         SizedBox(height: 20),
    //         Text(
    //           winnerName,
    //           style: TextStyle(fontSize: 20, color: Colors.white),
    //         ),
    //         SizedBox(height: 20),
    //         Text(
    //           'Misses: ${playerStats[0]['misses']}',
    //           style: TextStyle(fontSize: 18, color: Colors.white),
    //         ),
    //         Text(
    //           'Hits: ${playerStats[0]['hits']}',
    //           style: TextStyle(fontSize: 18, color: Colors.white),
    //         ),
    //         SizedBox(height: 20),
    //         ElevatedButton(
    //           onPressed: () {
    //             Navigator.push(context,
    //                 MaterialPageRoute(builder: (context) => OnBoarding()));
    //           },
    //           child: Text('New Game'),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
