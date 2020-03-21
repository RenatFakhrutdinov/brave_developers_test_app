import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

enum WaitPaymentEvent { pay }
enum WaitPaymentState { initialState, wait }

class WaitPaymentBloc extends Bloc<WaitPaymentEvent, WaitPaymentState> {
  @override
  WaitPaymentState get initialState => WaitPaymentState.initialState;

  @override
  Stream<WaitPaymentState> mapEventToState(WaitPaymentEvent event) async* {
    yield WaitPaymentState.wait;

    int randomSec = 1 + Random().nextInt(6);

    ///wait randomSec seconds
    Future.delayed(Duration(seconds: randomSec));
    yield WaitPaymentState.initialState;
  }
}
