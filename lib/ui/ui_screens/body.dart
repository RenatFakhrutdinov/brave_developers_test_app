import 'package:brave_developers_test_app/res/strings.dart';
import 'package:brave_developers_test_app/ui/ui_components/buttons_wrap.dart';
import 'package:brave_developers_test_app/ui/ui_components/footer.dart';
import 'package:brave_developers_test_app/ui/ui_components/logo_title.dart';
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
            child: constraints.constrainWidth() > 1210
                ? _wideScreen()
                : _narrowScreen(),
          ),
          constraints.constrainHeight() > 700
              ? Footer(constraints: constraints)
              : SizedBox.shrink()
        ],
      );
    });
  }

  Widget _narrowScreen() {

    ///todo align center
    return ListView(
      children: <Widget>[
        LogoTitle(),
        ButtonsWrap(),
      ],
    );
  }

  Widget _wideScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        LogoTitle(),
        ButtonsWrap(),
        Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: SelectableText(Strings.chooseOperator),
        )
      ],
    );
  }
}
