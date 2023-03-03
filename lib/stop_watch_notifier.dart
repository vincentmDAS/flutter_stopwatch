import 'dart:async';

import 'package:flutter/material.dart';

class StopWatchNotifier extends ChangeNotifier {
  List<String> _lapTimes = [];
  Duration _stopWatchTimer = Duration.zero;
  Timer? timer;

  String get displayTime {
    if (_stopWatchTimer == Duration.zero) {
      timer?.cancel();
      return '00:00.00';
    }

    return _stopWatchTimer.toString().substring(2, 10);
  }

  List<String> get lapTimes => _lapTimes;

  void lap() {
    _lapTimes.add(displayTime);
    notifyListeners();
  }

  void reset() {
    _stopWatchTimer = Duration.zero;
    timer?.cancel();
    _lapTimes = [];
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
        notifyListeners();
      },
    );
  }
}
