import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';
import 'first.dart';
import 'second.dart';
import 'third.dart';

final ThemeData kIOSTheme = new ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey,
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = new ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent,
);

void main() {
  debugPaintSizeEnabled = false;
  runApp(new MaterialApp(
    title: "Flutter test-drive",
    home: LauncherApp(),
    theme:
        defaultTargetPlatform == TargetPlatform.iOS ? kIOSTheme : kDefaultTheme,
    routes: <String, WidgetBuilder>{
      '/1': (BuildContext context) => new First(),
      '/2': (BuildContext context) => new Second(),
      '/3': (BuildContext context) => new Third(),
    },
  ));
}

class LauncherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: const Text("Flutter test-drive"),
      ),
      body: new Launcher(),
    );
  }
}

class Launcher extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LauncherState();
}

class LauncherState extends State<Launcher> {
  void _pushToFirst() {
    Navigator.pushNamed(context, '/1');
  }

  void _pushToSecond() {
    Navigator.pushNamed(context, '/2');
  }

  void _pushToThird() {
    Navigator.pushNamed(context, '/3');
  }

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        MaterialButton(
          child: Text("To First"),
          onPressed: _pushToFirst,
        ),
        MaterialButton(
          child: Text("To Second"),
          onPressed: _pushToSecond,
        ),
        MaterialButton(
          child: Text("To Third"),
          onPressed: _pushToThird,
        )
      ],
    );
  }
}
