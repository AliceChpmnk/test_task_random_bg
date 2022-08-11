import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
/// The root of the App
class MyApp extends StatelessWidget {
  /// Passes the parameter key to the super constructor key parameter
  const MyApp({Key? key}) : super(key: key);

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
/// HomePage
class MyHomePage extends StatefulWidget {
  /// HomePage title
  final String title;
  /// declares MyHomePage named parameters
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Color currentColor = Colors.white;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void changeColor() {
    final Color newColor = Color.fromARGB(
      255,
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
    );
    setState(() {
      currentColor = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentColor,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: InkWell(
        onTap: () {
          changeColor();
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Hey there',
                style: TextStyle(fontSize: 40.0),
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
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
