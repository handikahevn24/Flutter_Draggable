import 'package:flutter/material.dart';
import 'dragObjek.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Offset posBox1 = Offset(60, 50);
  Offset posBox2 = Offset(320, 50);
  Offset posBox3 = Offset(600, 50);

  bool box1Accepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("img/background-gam-4.jpg"),
                fit: BoxFit.cover)),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Your Score: 0",
                  style: TextStyle(fontSize: 25, color: Colors.yellow),
                ),
                Container(
                  height: 130,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    DragTarget(
                      builder: (context, List<String> data, rj) {
                        return box1Accepted
                            ? Container(
                                color: Colors.green,
                                width: 170,
                                height: 170,
                                child: Text("Tepat Sekali!!"),
                                alignment: Alignment(0.0, 0.0),
                              )
                            : data.isEmpty
                                ? Container(
                                    color: Colors.teal,
                                    width: 170,
                                    height: 170,
                                    child: Text(
                                      "Teal",
                                      style: TextStyle(fontSize: 70),
                                    ),
                                    alignment: Alignment(0.0, 0.0),
                                  )
                                : Opacity(
                                    opacity: 0.5,
                                    child: Container(
                                      color: Colors.teal,
                                      width: 170,
                                      height: 170,
                                      child: Text(
                                        "Teal",
                                        style: TextStyle(fontSize: 70),
                                      ),
                                      alignment: Alignment(0.0, 0.0),
                                    ),
                                  );
                      },
                      onAccept: (data) {
                        if (data == "teal") {
                          setState(() {
                            box1Accepted = true;
                          });
                        }
                      },
                    ),
                    Container(
                      color: Colors.red,
                      width: 170,
                      height: 170,
                      child: Text(
                        "Red",
                        style: TextStyle(fontSize: 70),
                      ),
                      alignment: Alignment(0.0, 0.0),
                    ),
                    Container(
                      color: Colors.yellow,
                      width: 170,
                      height: 170,
                      child: Text(
                        "Yellow",
                        style: TextStyle(fontSize: 45),
                      ),
                      alignment: Alignment(0.0, 0.0),
                    ),
                  ],
                )
              ],
            ),
            DragObjek(
              warna: Colors.red,
              position: posBox1,
              dataNama: "red",
            ),
            DragObjek(
              warna: Colors.yellow,
              position: posBox2,
              dataNama: "yellow",
            ),
            DragObjek(
              warna: Colors.teal,
              position: posBox3,
              dataNama: "teal",
            ),
          ],
        ),
      ),
    );
  }
}
