// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:memory/common/constants/app_colors.dart';
import 'package:memory/onboarding.dart';
import 'package:memory/victoryScreen.dart';
import 'package:memory/empate.dart';

class PlayerStats {
  int misses;
  int hits;

  PlayerStats({this.misses = 0, this.hits = 0});
}

class GameScreen extends StatefulWidget {
  final List<String> playerNames;
  const GameScreen({Key? key, required this.playerNames}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool gameInit = false;
  int? firstSelectedIndex;
  int currentPlayerIndex = 0;
  int missCount = 0; //Auxilia no bloqueio da seleção de uma terceira
  bool pausedGame = false;
  int countPaused = 0;

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

  List<Map<String, int>> playerStats = [];
  List<bool> flippedCards = List.filled(16, false);
  late List<String> shuffledCards;

  @override
  void initState() {
    super.initState();

    playerStats = List.generate(widget.playerNames.length, (index) {
      return {'misses': 0, 'hits': 0};
    });

    shuffledCards = buildShuffledCards();
  }

  void playGame() {
    gameInit = true;
    currentPlayerIndex = 0;
    pausedGame = false; //Despausa o jogo, permitindo que o jogador clique nas cartas
    if (countPaused >= 1) return; //Caso o jogador tenha clicado em Pause, um contador é incrementado.
    //Então se Pause já foi clicado 1 vez ou mais, as cartas não podem ser viradas novamente.
    turnAllCards();
    Future.delayed(Duration(seconds: 3), () {
      turnAllCards();
    });
  }

  void resetGame() {
    pausedGame = false; //Despausa o jogo, para o caso em que ele esteja pausado
    _secondsElapsed = 0;
    shuffledCards = buildShuffledCards();
    playGame();
    playerStats = List.generate(widget.playerNames.length, (index) {
      return {'misses': 0, 'hits': 0};
    });
  }

  void pauseGame() {
    setState(() {
      pausedGame = true;
      countPaused++;
    });
    _stopTimer();
  }

  void turnAllCards() {
    setState(() {
      flippedCards = List.filled(16, !flippedCards[0]);
    });
  }

  void checkWinCondition() {
    int hitsPlayer1 = playerStats[0]['hits'] ?? 0;
    int hitsPlayer2 = playerStats.length > 1 ? playerStats[1]['hits'] ?? 0 : 0;

    int totalHits = hitsPlayer1 + hitsPlayer2;

    if (totalHits == shuffledCards.length ~/ 2) {
      if (hitsPlayer1 > hitsPlayer2) {
        showVictoryScreen(0); // Player 1 é o vencedor
      } else if (hitsPlayer2 > hitsPlayer1) {
        showVictoryScreen(1); // Player 2 é o vencedor
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Empate(),
          ),
        );
      }
    }
  }

  void showVictoryScreen(int winningPlayerIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VictoryScreen(
          winnerName: widget.playerNames[winningPlayerIndex],
          playerStats: playerStats,
          winnerStats: playerStats[winningPlayerIndex],
          playerNames: widget.playerNames,
        ),
      ),
    );
  }

  List<String> buildShuffledCards() {
    List<String> allCards = [...cardValues, ...cardValues];
    allCards.shuffle();
    return allCards;
  }

  void onCardTap(int index) {
    if (gameInit == false) return;
    if (flippedCards[index])
      return; //Evita o incremento dos Hits quando um par já foi encontrado
    if (missCount == 1) return;
    if (pausedGame == true) return;

    setState(() {
      if (firstSelectedIndex == null) {
        // Primeira carta selecionada
        firstSelectedIndex = index;
        flippedCards[index] = true;
      } else {
        // Segunda carta selecionada
        if (firstSelectedIndex != index) {
          flippedCards[index] = true;

          // Verifica se as cartas são diferentes
          if (shuffledCards[firstSelectedIndex!] != shuffledCards[index]) {
            missCount = 1;
            // Aguarda um breve momento antes de desvirar as cartas
            Future.delayed(Duration(seconds: 1), () {
              flippedCards[firstSelectedIndex!] = false;
              flippedCards[index] = false;
              playerStats[currentPlayerIndex]!['misses'] =
                  (playerStats[currentPlayerIndex]!['misses'] ?? 0) + 1;

              setState(() {
                // Limpa o índice da primeira carta selecionada
                firstSelectedIndex = null;
              });

              currentPlayerIndex =
                  (currentPlayerIndex + 1) % widget.playerNames.length;
              missCount = 0;
            });
          } else {
            // Cartas iguais, incrementa o contador de acertos
            playerStats[currentPlayerIndex]!['hits'] =
                (playerStats[currentPlayerIndex]!['hits'] ?? 0) + 1;

            firstSelectedIndex = null;
          }
        }
      }
    });
    if (gameInit) {
      checkWinCondition();
    }
  }

  Widget buildCard(int index, String cardValue) {
    return GestureDetector(
      onTap: () {
        onCardTap(index);
      },
      child: Container(
        width: 80,
        height: 120,
        decoration: BoxDecoration(
          color: Color(0xFF3C4A63),
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.all(4),
        child: Center(
          child: flippedCards[index]
              ? Image.asset(
                  'assets/images/$cardValue',
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                )
              : Image.asset(
                  'assets/images/img-capa.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ), // Mostra a capa da carta se não estiver virada / No meu ainda não funciona, provavelmente problema no build tbm
        ),
      ),
    );
  }

  List<Widget> buildCardWidgets(List<String> shuffledCards) {
    return List.generate(shuffledCards.length, (index) {
      return buildCard(index, shuffledCards[index]);
    });
  }

  late Timer _timer;
  int _secondsElapsed = 0;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _secondsElapsed++;
      });
    });
  }

  void _stopTimer() {
    _timer.cancel(); // Cancela o timer
  }

  String _formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds ~/ 60) % 60;
    int secs = seconds % 60;

    String hoursStr = (hours % 24).toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = secs.toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secondsStr';
  }

  @override
  Widget build(BuildContext context) {
    // String playerName = widget.playerNames.isNotEmpty
    //     ? widget.playerNames[currentPlayerIndex]
    //     : 'Nome do Jogador';
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only(top: 16, left: 24, bottom: 12),
              child: Row(children: <Widget>[
                SizedBox(
                  child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OnBoarding()));
                      }),
                ),
                SizedBox(width: 90),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: 180,
                          child: Text(
                            "Memory Game",
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "KronaOne",
                                fontSize: 20,
                                color: Colors.white),
                          )),
                    ],
                  ),
                )
              ]),
              // color: Colors.white
            ),
            if (widget.playerNames.length == 1)
              Text(
                "One Player -  ${widget.playerNames[0]}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            if (widget.playerNames.length > 1)
              Text(
                "Turn: ${widget.playerNames[currentPlayerIndex]}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      'Misses',
                      style: TextStyle(
                        color: Color(0xFFFF4D4D),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      playerStats[currentPlayerIndex]['misses'].toString(),
                      style: TextStyle(
                        color: Color(0xFFFF4D4D),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Hits',
                      style: TextStyle(
                        color: Color(0xFF38F2A4),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      playerStats[currentPlayerIndex]['hits'].toString(),
                      style: TextStyle(
                        color: Color(0xFF38F2A4),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: shuffledCards.length,
                itemBuilder: (context, index) {
                  return buildCard(index, shuffledCards[index]);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 16),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.00),
                    color: AppColors.inputBack,
                  ),
                  width: 320,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        // color: Colors.blue,
                        child: IconButton(
                            onPressed: () {
                              playGame();
                              _startTimer();
                            },
                            icon: Icon(Icons.play_arrow, color: Colors.white)),
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        // color: Colors.green,
                        child: IconButton(
                            onPressed: () {
                              resetGame();
                            },
                            icon: Icon(Icons.update, color: Colors.white)),
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        // color: Colors.green,
                        child: IconButton(
                            onPressed: () {
                              pauseGame();
                            },
                            icon: Icon(Icons.pause, color: Colors.white)),
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.timer,
                              color: Colors.white,
                            ),
                            SizedBox(width: 12),
                            Text(
                              _formatTime(_secondsElapsed),
                              style: TextStyle(
                                fontFamily: "Inter",
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
