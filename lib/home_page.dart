import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stopwatch/widgets/generic_spacing.dart';

import 'model/stop_watch_notifier.dart';
import 'utility/constant.dart';
import 'widgets/lap_list_tile.dart';
import 'widgets/primary_button.dart';
import 'widgets/secondary_button.dart';

final stopWatchProvider = ChangeNotifierProvider<StopWatchNotifier>(
  (ref) => StopWatchNotifier(),
);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              VerticalSpace(10),
              TimerDisplay(),
              Laps(),
              Buttons(),
            ],
          ),
        ),
      ),
    );
  }
}

class TimerDisplay extends ConsumerWidget {
  const TimerDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final StopWatchNotifier myStopWatch = ref.watch(stopWatchProvider);

    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: const BoxDecoration(
        color: AppColors.backgroundGrey,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Center(
        child: Text(
          myStopWatch.displayTime,
          style: AppStyles.titleBoldBlack,
        ),
      ),
    );
  }
}

class Laps extends ConsumerWidget {
  const Laps({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final StopWatchNotifier myStopWatch = ref.watch(stopWatchProvider);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.9,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (myStopWatch.isActive)
              LapListTile(
                leading: Text('Lap ${myStopWatch.lapTimes.length + 1}'),
                trailing: Text(myStopWatch.displayTime),
              ),
            for (final lapTime in myStopWatch.lapTimes.reversed)
              LapListTile(
                key: UniqueKey(),
                leading: Text(
                  'Lap ${myStopWatch.lapTimes.indexOf(lapTime) + 1}',
                ),
                trailing: Text(lapTime),
              ),
          ],
        ),
      ),
    );
  }
}

class Buttons extends ConsumerWidget {
  const Buttons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final StopWatchNotifier myStopWatch = ref.watch(stopWatchProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SecondaryButton(
          displayText:
              myStopWatch.isRunning ? AppStrings.lap : AppStrings.reset,
          onPressed: () {
            myStopWatch.isRunning ? myStopWatch.lap() : myStopWatch.reset();
          },
          isEnabled: myStopWatch.isActive,
        ),
        PrimaryButton(
          displayText:
              myStopWatch.isRunning ? AppStrings.stop : AppStrings.start,
          onPressed: () {
            myStopWatch.isRunning ? myStopWatch.stop() : myStopWatch.run();
          },
          isStartButton: !myStopWatch.isRunning,
        ),
      ],
    );
  }
}
