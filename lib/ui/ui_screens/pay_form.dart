import 'package:brave_developers_test_app/helpers/wait_payment_bloc.dart';
import 'package:brave_developers_test_app/res/strings.dart';
import 'package:brave_developers_test_app/ui/ui_components/logo_title.dart';
import 'package:brave_developers_test_app/ui/ui_components/pay_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PayForm extends StatefulWidget {
  final String pictUrl;
  final String operatorName;

  const PayForm({Key key, this.pictUrl, this.operatorName}) : super(key: key);

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

      if (_phoneController.text.length > 15) {
        _phoneController.text = _phoneController.text.substring(0, 15);
      }
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
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            constraints.constrainHeight() > 630
                ? LogoTitle()
                : SizedBox.shrink(),
            BlocBuilder(
                bloc: _waitPaymentBloc,
                builder: (context, state) {
                  if (state is WaitPaymentWait) {
                    return CupertinoActivityIndicator();
                  } else if (state is WaitPaymentDone) {
                    return PayResult(
                      urlPict: 'assets/picts/tick.png',
                      resultString: Strings.payDone,
                      heightOfScreen: constraints.constrainHeight(),
                      action: () {
                        Navigator.of(context).pop();
                      },
                    );
                  } else if (state is WaitPaymentError) {
                    return PayResult(
                      urlPict: 'assets/picts/close.png',
                      resultString: Strings.payFailed,
                      heightOfScreen: constraints.constrainHeight(),
                      action: () {
                        _waitPaymentBloc.add(WaitPaymentEvent.tryAgain);
                      },
                    );
                  } else
                    return _phoneForm(constraints.constrainHeight());
                }),
            constraints.constrainHeight() > 630
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: SelectableText(
                      Strings.footerMessage,
                      textAlign: TextAlign.center,
                    ),
                  )
                : SizedBox(
                    width: MediaQuery.of(context).size.width,
                  )
          ],
        );
      }),
    );
  }

  Widget _phoneForm(double heightOfScreen) {
    return Container(
      height: heightOfScreen > 450 ? 444 : 295,
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
          heightOfScreen > 450
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        height: 100,
                        width: 100,
                        child: Hero(
                            tag: widget.pictUrl,
                            child: Image.network(widget.pictUrl))),
                    SizedBox(width: 16),
                    SelectableText(
                      widget.operatorName,
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                )
              : SizedBox.shrink(),
          heightOfScreen > 450
              ? Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(Strings.phoneNumber),
                )
              : SizedBox.shrink(),
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
          heightOfScreen > 450
              ? Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(Strings.sum),
                )
              : SizedBox.shrink(),
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
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    Strings.toMainPage,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: RaisedButton(
                  onPressed: () => _dispatchWaitPaymentBloc(),
                  child: Text(
                    Strings.pay,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
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
