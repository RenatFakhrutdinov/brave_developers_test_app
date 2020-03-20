import 'package:brave_developers_test_app/res/strings.dart';
import 'package:flutter/material.dart';
import 'operator_card.dart';

class ButtonsWrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
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
    );
  }
}
