import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum WaitPaymentEvent { pay }

class WaitPaymentBloc extends Bloc<WaitPaymentEvent, WaitPaymentState> {
  @override
  WaitPaymentState get initialState => WaitPaymentInit();

  @override
  Stream<WaitPaymentState> mapEventToState(WaitPaymentEvent event) async* {
    yield WaitPaymentWait();
    int randomSec = 1 + Random().nextInt(6);

    ///wait randomSec seconds
    await Future.delayed(Duration(seconds: randomSec));

    ///the probability coefficient of success is 0.7
    int randomValue = Random().nextInt(9);
    if (randomValue < 7) {
      yield WaitPaymentDone();
    } else
      yield WaitPaymentError();
  }
}

abstract class WaitPaymentState extends Equatable {
  const WaitPaymentState();

  @override
  List<Object> get props => [];
}

class WaitPaymentInit extends WaitPaymentState {}

class WaitPaymentWait extends WaitPaymentState {}

class WaitPaymentDone extends WaitPaymentState {}

class WaitPaymentError extends WaitPaymentState {}
