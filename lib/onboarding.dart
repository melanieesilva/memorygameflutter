// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:memory/common/constants/app_colors.dart';
import 'package:memory/gameScreen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<TextEditingController> controllers = [TextEditingController()];
  @override
  Widget build(BuildContext context) {
    // double heightScreen = MediaQuery.of(context).size.height;
    // double containerSize = heightScreen * 0.8;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 70, left: 20, right: 20),
            child: Column(children: <Widget>[
              Text(
                "WELCOME TO THE",
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  height: 0,
                ),
              ),
              Container(
                width: 217,
                margin: EdgeInsets.only(top: 8, bottom: 90),
                child: Text(
                  "MEMORY GAME",
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "KronaOne",
                      fontSize: 32,
                      color: Colors.white),
                ),
              ),
              Text(
                "Add Up To 2 Players",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  height: 0,
                ),
              ),
              Container(
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controllers.length,
                      itemBuilder: (context, index) {
                        return Row(children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextField(
                                  controller: controllers[index],
                                  decoration: InputDecoration(
                                      labelText: 'Player name ${index + 1}',
                                      labelStyle:
                                          TextStyle(color: Color.fromARGB(255, 172, 164, 192)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          borderSide:
                                              BorderSide(color: Colors.blue)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.circular(100)
                                      ), floatingLabelStyle: TextStyle(color: Colors.white)
                                    ),
                                  style: TextStyle(
                                    color: Colors.white
                                  )
                                  ),
                            ),
                          ),
                          if (index == 0)
                            IconButton(
                              icon: Icon(Icons.add), 
                              color: Colors.white,
                              onPressed: () {
                                setState(() {
                                  if (controllers.length == 1) {
                                    controllers.add(TextEditingController());
                                  }
                                });
                              },
                            ),
                          if (index == 1)
                            IconButton(
                              icon: Icon(Icons.remove),
                              color: Colors.white,
                              onPressed: () {
                                setState(() {
                                  if (controllers.length > 1) {
                                    controllers.removeLast();
                                  }
                                });
                              },
                            ),
                        ]);
                      }),
                  padding:
                      EdgeInsets.only(top: 24, bottom: 16, left: 20, right: 20),
                  width: double.infinity)
            ]),
            width: double.infinity,
            // height: containerSize,
            // color: Colors.blue,
          ),

          // SizedBox(height:20),
          Container(
            child: ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Play Now",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.arrow_right,
                    size: 32,
                    color: Colors.white,
                  )
                ],
              ),
              onPressed: () {
                List<String> playerNames = controllers.map((controller) => controller.text)
                .toList();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GameScreen(playerNames:playerNames)
                )
              );
              }, 
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  backgroundColor: AppColors.btnColor),
            ),
            width: double.infinity,
            padding: EdgeInsets.only(top: 16, bottom: 24, left: 12, right: 12),
          ),
        ],
      ),
    );
  }
}
