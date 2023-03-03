import 'package:flutter_stopwatch/utility/constant.dart';
import 'package:flutter_stopwatch/utility/helper.dart';
import 'package:test/test.dart';

void main() {
  test('Should return correct zero format when duration is zero', () {
    expect(AppStrings.zeroTimeDisplay, Helper.formatDisplayTime(Duration.zero));
  });

  test('Should return correct number format when duration is valid', () {
    expect(
      '01:02.30',
      Helper.formatDisplayTime(
        const Duration(minutes: 1, seconds: 2, milliseconds: 300),
      ),
    );
  });
}
