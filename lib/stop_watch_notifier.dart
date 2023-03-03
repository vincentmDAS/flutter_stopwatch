import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_stopwatch/constant.dart';
import 'package:flutter_stopwatch/helper.dart';

class StopWatchNotifier extends ChangeNotifier {
  List<String> _lapTimes = [];
  Duration _stopWatchTimer = Duration.zero;
  Timer? _timer;

  String get displayTime {
    if (_stopWatchTimer == Duration.zero) {
      _timer?.cancel();
      return AppStrings.zeroTimeDisplay;
    }

    return Helper.formatDisplayTime(_stopWatchTimer);
  }

  List<String> get lapTimes => _lapTimes;
  bool get isRunning => _timer?.isActive ?? false;

  void lap() {
    _lapTimes.add(displayTime);
    notifyListeners();
  }

  void reset() {
    _stopWatchTimer = Duration.zero;
    _timer?.cancel();
    _lapTimes = [];
    notifyListeners();
  }

  void stop() {
    _timer?.cancel();
    notifyListeners();
  }

  void run() {
    _timer = Timer.periodic(
      const Duration(milliseconds: 1),
      (timer) {
        _stopWatchTimer += const Duration(milliseconds: 1);
        notifyListeners();
      },
    );
  }
}
