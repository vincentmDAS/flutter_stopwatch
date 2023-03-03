import 'package:flutter_stopwatch/utility/constant.dart';
import 'package:flutter_stopwatch/utility/helper.dart';
import 'package:test/test.dart';

void main() {
  test('Should return correct zero format when duration is zero', () {
    expect(AppStrings.zeroTimeDisplay, Helper.formatDisplayTime(Duration.zero));
  });

  test('Should return correct number format when duration is given', () {
    expect(
      '02:05.00',
      Helper.formatDisplayTime(
        const Duration(minutes: 2, seconds: 5),
      ),
    );
  });

  test('Should return correct zero format when duration is zero', () {
    Duration duration;
    expect(AppStrings.zeroTimeDisplay, Helper.formatDisplayTime(duration));
  });
}
