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

  List<bool> flippedCards = List.filled(16, false);
  int misses = 0;
  int hits = 0;
  late List<String> shuffledCards;

  @override
  void initState() {
    super.initState();
    shuffledCards = buildShuffledCards();
  }

  List<String> buildShuffledCards() {
    List<String> allCards = [...cardValues, ...cardValues];
    allCards.shuffle();
    return allCards;
  }

  Widget buildCard(int index, String cardValue) {
    return GestureDetector(
      onTap: () {
        setState(() {
          flippedCards[index] = !flippedCards[index];
        });
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
              : Container(), // Oculta a imagem se não estiver virada
        ),
      ),
    );
  }

  List<Widget> buildCardWidgets(List<String> shuffledCards) {
    return List.generate(shuffledCards.length, (index) {
      return buildCard(index, shuffledCards[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    String playerName = widget.playerNames.isNotEmpty
        ? widget.playerNames[0]
        : 'Nome do Jogador';

    return Scaffold(
      appBar: AppBar(
        title: Text('Memory Game'),
        centerTitle: true,
        backgroundColor: Color(0xFF202838),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'One Player - $playerName',
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
                      misses.toString(),
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
                      hits.toString(),
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
          ],
        ),
      ),
    );
  }
}
