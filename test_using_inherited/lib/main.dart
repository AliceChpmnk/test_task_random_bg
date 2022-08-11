import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Max number of every ARGB channel
const colorsMax = 255;

/// The root of the App
class MyApp extends StatelessWidget {
  /// Passes the parameter key to the super constructor key parameter
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RandomColor(
      changeColor: (Color color) => color = Color.fromARGB(
        colorsMax,
        Random().nextInt(colorsMax + 1),
        Random().nextInt(colorsMax + 1),
        Random().nextInt(colorsMax + 1),
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
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

/// InheritedWidget that implements random color changing
class RandomColor extends InheritedWidget {
  /// Old project to perform function calls
  final Function changeColor;

  /// Let specify a child and a changeColor function
  const RandomColor({
    Key? key,
    required Widget child,
    required this.changeColor,
  }) : super(key: key, child: child);

  /// tells the framework to rebuild the widgets that inherit from RandomColor
  @override
  bool updateShouldNotify(RandomColor oldWidget) => true;

  /// tries to find a widget that matches the type of RandomColor
  static RandomColor of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RandomColor>()
        as RandomColor;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Color backgroundColor = Colors.white;
  Color buttonColor = Colors.blueAccent;

  void changeBackgroundColor() {
    setState(() {
      backgroundColor =
          RandomColor.of(context).changeColor(backgroundColor) as Color;
    });
  }

  void changeButtonColor() {
    setState(() {
      buttonColor = RandomColor.of(context).changeColor(buttonColor) as Color;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: InkWell(
        onTap: () {
          changeBackgroundColor();
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
        backgroundColor: buttonColor,
        onPressed: () {
          _incrementCounter();
          changeButtonColor();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
