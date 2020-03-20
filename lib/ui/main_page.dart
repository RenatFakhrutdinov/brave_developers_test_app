import 'package:flutter/material.dart';

import 'ui_screens/body.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.blue.withOpacity(0.2),
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.blue.withOpacity(0.05),
          ),
          textTheme:
              TextTheme(bodyText2: TextStyle(fontFamily: "OldStandart"))),
      home: Scaffold(
        body: Body(),
      ),
    );
  }
}
