import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.red,
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text("Contacts"),
              Row(
                children: <Widget>[
                  Image.network('assets/github.png'),
                  Text("My Github")
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(CupertinoIcons.mail, size: 32,),
                  Text('renat.fakhrutdinov@bravedevelopers.com')
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}
