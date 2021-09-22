import 'package:flutter/material.dart';

import 'microstores/microstores.dart';
import 'stores/microstores.dart';

void main() {
  runApp(MicrostoresProvider(
    child: const MyApp(),
    controller: Controller(microstores: allMicrostores),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Microstores Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  void _incrementCounter() {
    counterStore.write(counterStore.read() + 1, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Consumer(
          // builder: () => Text('SOME TEXT'),
          builder: (BuildContext context, Controller controller) {
            final counter = controller.read('counterStore');
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            );
          },
          microstores: const ['counterStore', 'testStore'],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
