import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Duration _stopWatchTimer = Duration.zero;
  Timer? timer;

  void runTimer() {
    timer = Timer.periodic(
      const Duration(milliseconds: 1),
      (timer) {
        setState(() {
          _stopWatchTimer += const Duration(milliseconds: 1);
          // TODO remove this
          if (timer.tick == 5000) {
            timer.cancel();
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${_stopWatchTimer.inMinutes.toString().padLeft(2, '0')}:${(_stopWatchTimer.inMilliseconds / 1000).toString()}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              runTimer();
            },
            tooltip: 'Start',
            child: const Icon(Icons.start),
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              timer?.cancel();
            },
            tooltip: 'Stop',
            child: const Icon(Icons.stop),
          ),
        ],
      ),
    );
  }
}
