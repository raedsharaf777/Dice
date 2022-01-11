import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.teal,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          leading: Icon(Icons.account_balance_rounded),
          title: Text(
            'Dice',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        body: Dice(),
      ),
    );
  }
}

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftfdice = 6;
  int rightdice = 6;

  @override
  Widget build(BuildContext context) {
    void generateRandom() {
      setState(() {
        leftfdice = new Random().nextInt(5)+1 ;
        rightdice = new Random().nextInt(5)+1 ;
      });
    }

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        print('L $leftfdice');

                        setState(() {
                          generateRandom();
                        });
                      },
                      child: Image.asset('images/dice$leftfdice.jpg')),
                ),
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        print('R $rightdice');
                        setState(() {
                          generateRandom();
                        });
                      },
                      child: Image.asset('images/dice$rightdice.jpg')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
