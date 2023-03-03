import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main.dart';
import 'model/stop_watch_notifier.dart';
import 'utility/constant.dart';
import 'widgets/primary_button.dart';
import 'widgets/secondary_button.dart';

final stopWatchProvider = ChangeNotifierProvider<StopWatchNotifier>(
  (ref) => StopWatchNotifier(),
);

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StopWatchNotifier myStopWatch = ref.watch(stopWatchProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                myStopWatch.displayTime,
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.9,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (myStopWatch.isActive)
                        ListTile(
                          leading:
                              Text('Lap ${myStopWatch.lapTimes.length + 1}'),
                          trailing: Text(myStopWatch.displayTime),
                        ),
                      for (final lapTime in myStopWatch.lapTimes.reversed)
                        ListTile(
                          key: UniqueKey(),
                          leading: Text(
                            'Lap ${myStopWatch.lapTimes.indexOf(lapTime) + 1}',
                          ),
                          trailing: Text(lapTime),
                        ),
                    ],
                  ),
                ),
              ),
              const Buttons(),
            ],
          ),
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
    StopWatchNotifier myStopWatch = ref.watch(stopWatchProvider);

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
