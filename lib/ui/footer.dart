import 'package:brave_developers_test_app/helpers/url_helper.dart';
import 'package:brave_developers_test_app/res/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      print('${constraints.constrainWidth()}');
      return Container(
        height: 200,
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SelectableText(
                      Strings.contacts,
                      style: TextStyle(fontSize: 20),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Row(
                        children: <Widget>[
                          Image.network('assets/github.png'),
                          SizedBox(width: 8),
                          InkWell(
                              onTap: () => openGithub(),
                              child: Text(Strings.myGitHub))
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
                        InkWell(
                            onTap: () {
                              sendEmail();
                            },
                            child: Text(
                              Strings.mailOfAuthor,
                              style: TextStyle(color: Colors.blue),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              constraints.constrainWidth() > 650
                  ? Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SelectableText(
                            Strings.title,
                            style: TextStyle(fontSize: 20),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 24),
                              child: SelectableText(Strings.footerMessage))
                        ],
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      );
    });
  }
}
