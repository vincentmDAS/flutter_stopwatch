import 'dart:async';

import 'package:flutter/material.dart';

class StopWatchNotifier extends ChangeNotifier {
  Duration _stopWatchTimer = Duration.zero;
  Timer? timer;

  StopWatchNotifier();

  String get displayTime {
    if (_stopWatchTimer == Duration.zero) {
      timer?.cancel();
      return '00:00.00';
    }

    return _stopWatchTimer.toString().substring(2, 10);
  }

  void reset() {
    _stopWatchTimer = Duration.zero;
    timer?.cancel();
    notifyListeners();
  }

  void stop() {
    timer?.cancel();
    notifyListeners();
  }

  void run() {
    timer = Timer.periodic(
      const Duration(milliseconds: 1),
      (timer) {
        _stopWatchTimer += const Duration(milliseconds: 1);
        //TODO remove this
        if (timer.tick == 5000) {
          timer.cancel();
        }
        notifyListeners();
      },
    );
  }
}
