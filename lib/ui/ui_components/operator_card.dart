import 'package:brave_developers_test_app/ui/ui_screens/pay_form.dart';
import 'package:flutter/material.dart';

class OperatorCard extends StatelessWidget {
  final String pictUrl;
  final String operatorName;

  const OperatorCard({Key key, this.pictUrl, this.operatorName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              offset: Offset(
                4.0,
                2.0,
              ),
            )
          ]),
      child: FlatButton(
        color: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PayForm(
                pictUrl: pictUrl,
                operatorName: operatorName,
              ),
            ),
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            //color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          height: 188,
          width: 136,
          child: Column(
            children: <Widget>[
              Hero(
                tag: pictUrl,
                child: Image.network(pictUrl),
              ),
              SizedBox(height: 16),
              SelectableText(
                operatorName,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
