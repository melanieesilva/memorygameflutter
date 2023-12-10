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
  List<String> cardValues = [
    "cherry_blossom.png",
    "closed_umbrella.png",
    "crystal_ball.png",
    "nazar_amulet.png",
    "purple_heart.png",
    "rainbow.png",
    "turtle.png",
    "umbrella_rain.png"
  ];

  List<Widget> buildCardWidgets() {
    List<String> allCards = [...cardValues, ...cardValues];
    
    return allCards.map((value) {
      return buildCard(value);
    }).toList();
  }

  Widget buildCard(String cardValue) {
    return Container(
      width: 68,
      height: 100,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 68,
              height: 100,
              decoration: ShapeDecoration(
                color: Color(0xFF3C4A63),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          Positioned(
            left: 4,
            top: 46,
            child: SizedBox(
              width: 60,
              child: Text(
                'MYMG',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFB4CEFF),
                  fontSize: 10,
                  fontFamily: 'Krona One',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 24,
            top: 24,
            child: Image.asset(
              'assets/$cardValue',
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String playerName = widget.playerNames.isNotEmpty
        ? widget.playerNames[0]
        : 'Nome do Jogador';

    return Container(
      width: 360,
      height: 800,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: Color(0xFF202838)),
      child: Stack(
        children: [
          Positioned(
            left: 103,
            top: 40,
            child: SizedBox(
              width: 153,
              child: Text(
                'Memory Game',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.08,
                  fontFamily: 'Krona One',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
          Positioned(
            left: (360 - 153) / 2, // Posiciona horizontalmente para centralizar
            top: 94,
            child: Container(
              alignment: Alignment.center, // Alinha o conteúdo ao centro
              child: SizedBox(
                width: 153,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'One Player - ',
                        style: TextStyle(
                          color: Color(0xFF6EA0FF),
                          fontSize: 10,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      TextSpan(
                        text: playerName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Positioned(
            left: 69,
            top: 163,
            child: Container(
              width: 105,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: ShapeDecoration(
                color: Color(0xFF2C374A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Misses',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFF4D4D),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(width: 22),
                  Text(
                    '0',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFF4D4D),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 186,
            top: 163,
            child: Container(
              width: 105,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: ShapeDecoration(
                color: Color(0xFF2C374A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Hits',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF38F2A4),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(width: 22),
                  Text(
                    '0',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF38F2A4),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 25,
            top: 40,
            child: Container(
              width: 24,
              height: 24,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
            ),
          ),
          Positioned(
            left: 24,
            top: 228,
            child: Container(
              width: 312,
              height: 400, // Altura suficiente para exibir todas as cartas
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // Número de colunas
                  crossAxisSpacing: 8.0, // Espaçamento entre colunas
                  mainAxisSpacing: 8.0, // Espaçamento entre linhas
                ),
                itemCount: buildCardWidgets().length,
                itemBuilder: (context, index) {
                  return buildCardWidgets()[index];
                },
              ),
            ),
          ),
          Positioned(
            left: 24,
            top: 712,
            child: Container(
              width: 312,
              padding: const EdgeInsets.symmetric(horizontal: 28),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Color(0xFF2C374A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  Container(
                    padding: const EdgeInsets.all(12),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 2.86,
                                top: 2.85,
                                child: Container(
                                  width: 18.29,
                                  height: 18.29,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          'Timer',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFB4CEFF),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
