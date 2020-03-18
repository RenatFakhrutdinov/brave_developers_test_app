import 'package:brave_developers_test_app/res/strings.dart';
import 'package:brave_developers_test_app/ui/footer.dart';
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
          constraints.constrainHeight() > 500
              ? Footer(constraints: constraints)
              : SizedBox.shrink()
        ],
      );
    });
  }
}
