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
      return ListView(
        children: <Widget>[
          Text(Strings.title),
          Footer(constraints: constraints)
        ],
      );
    });
  }
}
