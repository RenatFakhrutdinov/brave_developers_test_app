import 'package:flutter/material.dart';

class OperatorCard extends StatelessWidget {
  final String pictUrl;
  final String operatorName;

  const OperatorCard({Key key, this.pictUrl, this.operatorName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      shape: new RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2,
                offset: Offset(
                  4.0, // horizontal, move right 10
                  2.0, // vertical, move down 10
                ),
              )
            ]),
        height: 140,
        width: 104,
        child: Column(
          children: <Widget>[
            Image.network(pictUrl),
            SizedBox(height: 16),
            SelectableText(
              operatorName,
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
