import 'package:brave_developers_test_app/res/strings.dart';
import 'package:brave_developers_test_app/ui/footer.dart';
import 'package:brave_developers_test_app/ui/operator_card.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(Strings.title),
          OperatorCard(
            pictUrl: 'assets/logos/mts.png',
            operatorName: Strings.mts,
          ),
          constraints.constrainHeight() > 700
              ? Footer(constraints: constraints)
              : SizedBox.shrink()
        ],
      );
    });
  }
}
