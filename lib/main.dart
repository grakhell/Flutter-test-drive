import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'first.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(new LauncherApp());
}

class LauncherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter test-drive app",
      home: Scaffold(
        appBar: new AppBar(
          title: const Text("Flutter test-drive"),
        ),
        body: new Launcher(),
      ),
    );
  }
}

class Launcher extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LauncherState();
}

class LauncherState extends State<Launcher> {

  void _pushToFirst() {
    Navigator.of(context).push(
      new MaterialPageRoute(
          builder: (BuildContext context) {
            return new First();
          }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        MaterialButton(
          child: Text("To First"),
          onPressed: _pushToFirst,
        )
      ],
    );
  }
}