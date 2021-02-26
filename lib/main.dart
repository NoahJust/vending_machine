import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:flutter/material.dart';

void main() async {
  Socket sock = await Socket.connect('192.168.1.147', 80);
  runApp(MyApp(sock));
}

class MyApp extends StatelessWidget {
  Socket socket;

  MyApp(Socket s) {
    this.socket = s;
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Spice Rack';
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        title: title,
        channel: socket,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final Socket channel;

  MyHomePage({Key key, @required this.title, @required this.channel})
      : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0.0,
          title: Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            padding: EdgeInsets.only(left: 20, right: 8),
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(25),
            ),
            child: TextField(
              cursorColor: Color(0xC65700),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                suffixIcon: new Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintText: "Rechercher",
                hintStyle: TextStyle(
                  color: Colors.white24,
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          )),
      body: ListView(
        padding: const EdgeInsets.all(1),
        children: <Widget>[
          ListTile(
              title: Text("BADIANE"),
              subtitle: Image(
                image: AssetImage('assets/images/badiane.png'),
              ),
              onLongPress: () => widget.channel.write("1\n")),
          ListTile(
              title: Text("CANELLE"),
              subtitle: Image(
                image: AssetImage('assets/images/canelle.png'),
              ),
              onLongPress: () => widget.channel.write("2\n")),
          ListTile(
              title: Text("CURRY"),
              subtitle: Image(
                image: AssetImage('assets/images/curry.png'),
              ),
              onLongPress: () => widget.channel.write("3\n")),
          ListTile(
              title: Text("PAPRIKA"),
              subtitle: Image(
                image: AssetImage('assets/images/paprika.png'),
              ),
              onLongPress: () => widget.channel.write("4\n")),
          ListTile(
              title: Text("PIMENT"),
              subtitle: Image(
                image: AssetImage('assets/images/piment.png'),
              ),
              onLongPress: () => widget.channel.write("5\n")),
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.channel.close();
    super.dispose();
  }
}
