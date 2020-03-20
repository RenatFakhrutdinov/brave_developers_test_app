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
                  Wrap(
                    children: <Widget>[
                      OperatorCard(
                        pictUrl: 'assets/logos/mts.png',
                        operatorName: Strings.mts,
                      ),
                      OperatorCard(
                        pictUrl: 'assets/logos/megafon.png',
                        operatorName: Strings.megafon,
                      ),
                      OperatorCard(
                        pictUrl: 'assets/logos/beeline.png',
                        operatorName: Strings.beeline,
                      ),
                      OperatorCard(
                        pictUrl: 'assets/logos/tele2.png',
                        operatorName: Strings.tele2,
                      ),
                      OperatorCard(
                        pictUrl: 'assets/logos/yota.png',
                        operatorName: Strings.yota,
                      ),
                      OperatorCard(
                        pictUrl: 'assets/logos/rostelecom.png',
                        operatorName: Strings.rostelecom,
                      ),
                      OperatorCard(
                        pictUrl: 'assets/logos/tinkoff.png',
                        operatorName: Strings.tinkoff,
                      ),
                      OperatorCard(
                        pictUrl: 'assets/logos/sberbank.png',
                        operatorName: Strings.sberbank,
                      ),
                    ],
                  ),
                  SelectableText(Strings.chooseOperator),
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
