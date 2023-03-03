// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stopwatch/utility/constant.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_stopwatch/main.dart';

void main() {
  testWidgets('Should find initial display when the app start',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MyApp(),
      ),
    );

    expect(find.text(AppStrings.zeroTimeDisplay), findsOneWidget);
    expect(find.text(AppStrings.start), findsOneWidget);
    expect(find.text(AppStrings.reset), findsOneWidget);
    expect(find.text(AppStrings.stop), findsNothing);
    expect(find.text(AppStrings.lap), findsNothing);
  });
}
