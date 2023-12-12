import 'package:flutter/material.dart';
import 'package:memory/onboarding.dart';

class VictoryScreen extends StatelessWidget {
  final String winnerName;
  final List<Map<String, int>> playerStats;

  const VictoryScreen({
    Key? key,
    required this.winnerName,
    required this.playerStats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Adicionando o Center para centralizar verticalmente
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'The winner is:',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              winnerName,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              'Misses: ${playerStats[0]['misses']}',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Text(
              'Hits: ${playerStats[0]['hits']}',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OnBoarding()));
              },
              child: Text('New Game'),
            ),
          ],
        ),
      ),
    );
  }
}
