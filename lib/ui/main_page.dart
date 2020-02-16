import 'package:brave_developers_test_app/ui/footer.dart';
import 'package:flutter/material.dart';

import 'body.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomSheet: Footer(),
        body: Body(),
      ),
    );
  }
}
