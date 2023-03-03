import 'package:flutter/material.dart';

class AppStrings {
  const AppStrings._();

  static const String flutterStopWatch = 'Fluter Stopwatch';
  static const String start = 'Start';
  static const String stop = 'Stop';
  static const String reset = 'Reset';
  static const String lap = 'Lap';
  static const String zeroTimeDisplay = '00:00.00';
}

class AppColors {
  const AppColors._();
  static const Color backgroundWhite = Color(0xFFFEFFFE);
  static const Color backgroundRed = Color(0xFFFFD6E2);
  static const Color backgroundGreen = Color(0xFFD7FEED);
  static const Color backgroundGrey = Color(0xFFF7F6F7);
  static const Color mainRed = Color(0xFFEB0A72);
  static const Color mainGreen = Color(0xFF40EF5C);
  static const Color mainBlack = Color(0xFF040404);
  static const Color mainGrey = Color(0xFFD6D6D7);
}

class AppStyles {
  AppStyles._();

  static const TextStyle titleBoldBlack = TextStyle(
    color: AppColors.mainBlack,
    fontSize: 60,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle buttonMainGreen = TextStyle(
    fontSize: 20,
    color: AppColors.mainGreen,
  );
  static const TextStyle buttonMainRed = TextStyle(
    fontSize: 20,
    color: AppColors.mainRed,
  );
  static const TextStyle buttonMainBlack = TextStyle(
    fontSize: 20,
    color: AppColors.mainBlack,
  );
  static const TextStyle buttonMainGrey = TextStyle(
    fontSize: 20,
    color: AppColors.mainGrey,
  );
}
