import 'package:brave_developers_test_app/res/strings.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Center(child: Text(Strings.title));
        } else
          return Center(child: Text(Strings.title));
      },
    );
  }
}
