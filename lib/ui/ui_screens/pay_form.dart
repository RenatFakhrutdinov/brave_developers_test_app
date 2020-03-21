import 'package:brave_developers_test_app/ui/ui_components/logo_title.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PayForm extends StatefulWidget {
  @override
  _PayFormState createState() => _PayFormState();
}

class _PayFormState extends State<PayForm> {
  TextEditingController _phoneController = TextEditingController();
  MaskTextInputFormatter _phoneMask = MaskTextInputFormatter(
      mask: '+7 ( ### ) ###-##-##', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          LogoTitle(),
          _phoneForm(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
          )
        ],
      ),
    );
  }

  Widget _phoneForm() {
    return Container(
      height: 200,
      width: 400,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              offset: Offset(
                4.0,
                2.0,
              ),
            )
          ]),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _phoneController,
            inputFormatters: [_phoneMask],
          )
        ],
      ),
    );
  }
}
