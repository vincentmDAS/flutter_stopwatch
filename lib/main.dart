import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      title: 'Flutter Demo',
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
              Container(
                color: Colors.amber,
                height: MediaQuery.of(context).size.height * 0.2,
                child: const SingleChildScrollView(
                  child: Text('Lap'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      myStopWatch.reset();
                    },
                    tooltip: 'Reset',
                    child: const Icon(Icons.restore_outlined),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      //TODO
                    },
                    tooltip: 'Lap',
                    child: const Icon(Icons.save),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      myStopWatch.run();
                    },
                    tooltip: 'Start',
                    child: const Icon(Icons.play_arrow),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      myStopWatch.stop();
                    },
                    tooltip: 'Stop',
                    child: const Icon(Icons.stop),
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
