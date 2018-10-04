import 'package:flutter/material.dart';

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSelection = Container(
        padding: const EdgeInsets.all(32.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Oeschinen Lake Campground",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "Kandersteg, Switzerland",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            FavoriteWidget()
          ],
        ));

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: color,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                  fontSize: 12.0, fontWeight: FontWeight.w400, color: color),
            ),
          )
        ],
      );
    }

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.call, "CALL"),
          buildButtonColumn(Icons.near_me, "ROUTE"),
          buildButtonColumn(Icons.share, "SHARE"),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese "
            "Alps." + " Situated 1,578 meters above sea level, it is one of "
            "the larger Alpine Lakes. A gondola ride from Kandersteg, " +
            "followed by a half-hour walk through pastures and pine forest, " +
            "leads you to the lake, which warms to 20 degrees Celsius in " +
            "the summer. Activities enjoyed here include rowing, and " +
            "riding the summer toboggan run.",
        softWrap: true,
      ),
    );

    void _return() {
      Navigator.pop(context);
    }

    return MaterialApp(
      title: "Top Lakes",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Top Lakes"),
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: _return),
        ),
        body: ListView(
          children: <Widget>[
            Image.asset(
              "image/lake.jpg",
              width: 600.0,
              fit: BoxFit.fitWidth,
            ),
            titleSelection,
            buttonSection,
            textSection
          ],
        ),
      ),
    );
  }

}

class FavoriteWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {

  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if(_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0.0),
          child: IconButton(
              icon: (_isFavorited
                  ?Icon(Icons.star)
                  :Icon(Icons.star_border)),
              color: Colors.red,
              onPressed: _toggleFavorite
          ),
        ),
        SizedBox(
          width: 18.0,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        )
      ],
    );
  }
}