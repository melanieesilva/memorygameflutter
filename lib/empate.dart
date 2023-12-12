import 'package:flutter/material.dart';
import 'package:memory/onboarding.dart';
import 'package:memory/common/constants/app_colors.dart';

class Empate extends StatelessWidget {
  const Empate({
    Key? key,
  }) : super(key: key);

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
                            "The Result is...",
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
                        child: Text("Draw",
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "KronaOne",
                                fontSize: 32)),
                      ),
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
