import 'package:brave_developers_test_app/helpers/wait_payment_bloc.dart';
import 'package:brave_developers_test_app/res/strings.dart';
import 'package:brave_developers_test_app/ui/ui_components/logo_title.dart';
import 'package:brave_developers_test_app/ui/ui_components/pay_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PayForm extends StatefulWidget {
  @override
  _PayFormState createState() => _PayFormState();
}

class _PayFormState extends State<PayForm> {
  WaitPaymentBloc _waitPaymentBloc = WaitPaymentBloc();

  TextEditingController _phoneController = TextEditingController();
  TextEditingController _sumController = TextEditingController();
  MaskTextInputFormatter _phoneMask = MaskTextInputFormatter(
      mask: '(###) ###-##-##', filter: {"#": RegExp(r'[0-9]')});
  MaskTextInputFormatter _sumMask =
      MaskTextInputFormatter(mask: '#####', filter: {"#": RegExp(r'[0-9]')});

  String _errorPhone;
  String _sumError;

  @override
  void initState() {
    super.initState();

    _phoneController.addListener(() {
      setState(() {
        _errorPhone = null;
      });
    });

    _sumController.addListener(() {
      setState(() {
        _sumError = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          LogoTitle(),
          BlocBuilder(
              bloc: _waitPaymentBloc,
              builder: (context, state) {
                if (state is WaitPaymentWait) {
                  return CupertinoActivityIndicator();
                } else if (state is WaitPaymentDone) {
                  return PayResult(
                      urlPict: 'assets/picts/tick.png',
                      resultString: Strings.payDone);
                } else if (state is WaitPaymentError) {
                  return PayResult(
                      urlPict: 'assets/picts/close.png',
                      resultString: Strings.payFailed);
                } else
                  return _phoneForm();
              }),
          SizedBox(
            width: MediaQuery.of(context).size.width,
          )
        ],
      ),
    );
  }

  Widget _phoneForm() {
    return Container(
      height: 444,
      width: 330,
      padding: EdgeInsets.all(16),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network("assets/logos/mts.png"),
              SizedBox(width: 16),
              Text(
                Strings.tinkoff,
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 16, bottom: 8),
            child: Text(Strings.phoneNumber),
          ),
          TextField(
            controller: _phoneController,
            inputFormatters: [_phoneMask],
            decoration: InputDecoration(
                prefix: Text(
                  '+7',
                  style: TextStyle(color: Colors.black),
                ),
                hintText: Strings.putYourNumber,
                border: OutlineInputBorder(),
                errorText: _errorPhone),
            style: TextStyle(fontFamily: "OldStandart"),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16, bottom: 8),
            child: Text(Strings.sum),
          ),
          TextField(
            controller: _sumController,
            inputFormatters: [_sumMask],
            decoration: InputDecoration(
                hintText: Strings.sumHintMessage,
                border: OutlineInputBorder(),
                errorText: _sumError),
            style: TextStyle(fontFamily: "OldStandart"),
          ),
          SizedBox(
            height: 16,
          ),
          RaisedButton(
            onPressed: () => _dispatchWaitPaymentBloc(),
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  Strings.pay,
                  textAlign: TextAlign.center,
                )),
          )
        ],
      ),
    );
  }

  void _dispatchWaitPaymentBloc() {
    if (_phoneController.text.length < 15) {
      setState(() {
        _errorPhone = Strings.phoneErrorText;
      });
    }
    if (_sumController.text.isEmpty) {
      setState(() {
        _sumError = Strings.emptyPay;
      });
    }
    if (_sumController.text.isNotEmpty) {
      if (int.parse(_sumController.text) > 15000) {
        setState(() {
          _sumError = Strings.payErrorText;
        });
      }
      if (int.parse(_sumController.text) < 1) {
        setState(() {
          _sumError = Strings.emptyPay;
        });
      }
    }
    if (_phoneController.text.length == 15 &&
        _sumController.text.isNotEmpty &&
        int.parse(_sumController.text) > 0 &&
        int.parse(_sumController.text) <= 15000) {
      _waitPaymentBloc.add(WaitPaymentEvent.pay);
    }
  }
}
