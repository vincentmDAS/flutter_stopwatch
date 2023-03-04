import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_stopwatch/utility/constant.dart';
import 'package:flutter_stopwatch/utility/helper.dart';

class StopWatchNotifier extends ChangeNotifier {
  List<String> _lapTimes = [];
  Duration _stopWatchTimer = Duration.zero;
  Timer? _timer;
  bool _isActive = false;

  String get displayTime {
    if (_stopWatchTimer == Duration.zero) {
      _timer?.cancel();
      return AppStrings.zeroTimeDisplay;
    }

    return Helper.formatDisplayTime(_stopWatchTimer);
  }

  List<String> get lapTimes => _lapTimes;
  bool get isRunning => _timer?.isActive ?? false;
  bool get isActive => _isActive;

  void lap() {
    _lapTimes.add(displayTime);
    notifyListeners();
  }

  void reset() {
    _stopWatchTimer = Duration.zero;
    _timer?.cancel();
    _lapTimes = [];
    _isActive = false;
    notifyListeners();
  }

  void stop() {
    _timer?.cancel();
    notifyListeners();
  }

  /// This method is called to run the stop watch with 30 milliseconds interval as tested with actual stop watch timer
  void run() {
    _isActive = true;
    _timer = Timer.periodic(
      const Duration(milliseconds: 30),
      (timer) {
        _stopWatchTimer += const Duration(milliseconds: 30);
        notifyListeners();
      },
    );
  }
}
