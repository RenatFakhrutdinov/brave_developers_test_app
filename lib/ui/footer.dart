import 'package:brave_developers_test_app/res/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Contacts"),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Row(
                      children: <Widget>[
                        Image.network('assets/github.png'),
                        SizedBox(width: 8),
                        Text("My Github")
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.mail,
                        size: 32,
                      ),
                      SizedBox(width: 8),
                      Text('renat.fakhrutdinov@bravedevelopers.com')
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(Strings.title),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
