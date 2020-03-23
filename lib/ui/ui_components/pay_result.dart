import 'package:brave_developers_test_app/res/strings.dart';
import 'package:flutter/material.dart';

class PayResult extends StatelessWidget {
  final String urlPict;
  final String resultString;
  final Function action;
  final double heightOfScreen;

  const PayResult(
      {Key key,
      this.urlPict,
      this.resultString,
      this.action,
      this.heightOfScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightOfScreen > 450 ? 444 : 295,
      width: 330,
      padding: EdgeInsets.fromLTRB(16, 40, 16, 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.network(urlPict),
          SelectableText(
            resultString,
            style: TextStyle(fontSize: 20),
          ),
          RaisedButton(
            onPressed: action,
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  Strings.continueString,
                  textAlign: TextAlign.center,
                )),
          )
        ],
      ),
    );
  }
}
