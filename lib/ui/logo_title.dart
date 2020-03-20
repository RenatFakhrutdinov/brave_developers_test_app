import 'package:flutter/material.dart';

class LogoTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      TextSpan(children: [
        TextSpan(
            text: 'П',
            style:
            TextStyle(fontSize: 50, color: Colors.red[900])),
        TextSpan(
            text: 'о',
            style: TextStyle(
                fontSize: 50, color: Colors.yellow[900])),
        TextSpan(
            text: 'П',
            style: TextStyle(
                fontSize: 30,
                color: Colors.lightBlue,
                fontStyle: FontStyle.italic)),
        TextSpan(
            text: 'О',
            style: TextStyle(
                fontSize: 110,
                color: Colors.redAccent,
                shadows: [
                  BoxShadow(
                    color: Colors.blueGrey,
                    blurRadius: 2,
                    offset: Offset(
                      4.0, // horizontal, move right 10
                      2.0, // vertical, move down 10
                    ),
                  )
                ])),
        TextSpan(
            text: 'л',
            style: TextStyle(
                fontSize: 50, color: Colors.green[800])),
        TextSpan(
            text: 'н',
            style: TextStyle(
                fontSize: 40, color: Colors.pinkAccent)),
        TextSpan(
            text: 'R',
            style: TextStyle(
                fontSize: 35, color: Colors.lightBlueAccent)),
        TextSpan(
            text: 'E',
            style: TextStyle(fontSize: 40, color: Colors.black)),
        TextSpan(
            text: '4',
            style: TextStyle(
                fontSize: 50,
                color: Colors.red[900],
                fontStyle: FontStyle.italic)),
        TextSpan(
            text: 'k',
            style: TextStyle(
                fontSize: 50, color: Colors.orangeAccent)),
        TextSpan(
            text: 'А',
            style: TextStyle(
                fontSize: 40, color: Colors.brown[600])),
      ]),
      textAlign: TextAlign.center,
    );
  }
}
