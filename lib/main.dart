import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stopwatch/constant.dart';
import 'package:flutter_stopwatch/stop_watch_notifier.dart';

final stopWatchProvider = ChangeNotifierProvider<StopWatchNotifier>(
  (ref) => StopWatchNotifier(),
);

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.flutterStopWatch,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StopWatchNotifier myStopWatch = ref.watch(stopWatchProvider);

    return SafeArea(
      child: Scaffold(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      myStopWatch.isRunning
                          ? myStopWatch.lap()
                          : myStopWatch.reset();
                    },
                    tooltip: myStopWatch.isRunning
                        ? AppStrings.lap
                        : AppStrings.reset,
                    child: myStopWatch.isRunning
                        ? const Icon(Icons.save)
                        : const Icon(Icons.restore_outlined),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      myStopWatch.isRunning
                          ? myStopWatch.stop()
                          : myStopWatch.run();
                    },
                    tooltip: myStopWatch.isRunning
                        ? AppStrings.stop
                        : AppStrings.start,
                    child: myStopWatch.isRunning
                        ? const Icon(Icons.stop)
                        : const Icon(Icons.play_arrow),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
