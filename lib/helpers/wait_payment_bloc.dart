import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

enum WaitPaymentEvent { pay }

class WaitPaymentBloc extends Bloc<WaitPaymentEvent, bool> {
  @override
  bool get initialState => false;

  @override
  Stream<bool> mapEventToState(WaitPaymentEvent event) async* {
    print(4884);
    yield true;
    int randomSec = 1 + Random().nextInt(6);

    ///wait randomSec seconds
    await Future.delayed(Duration(seconds: randomSec));
    yield false;
  }
}
