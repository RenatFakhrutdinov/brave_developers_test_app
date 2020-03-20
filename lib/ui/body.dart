import 'package:brave_developers_test_app/res/strings.dart';
import 'package:brave_developers_test_app/ui/footer.dart';
import 'package:brave_developers_test_app/ui/logo_title.dart';
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  LogoTitle(),
                  OperatorCard(
                    pictUrl: 'assets/logos/mts.png',
                    operatorName: Strings.mts,
                  ),
                  SizedBox.shrink()
                ],
              ),
            ),
          ),
          constraints.constrainHeight() > 700
              ? Footer(constraints: constraints)
              : SizedBox.shrink()
        ],
      );
    });
  }
}
