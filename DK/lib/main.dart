import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      /* home: Scaffold(
        body: Image.asset("lib/images/dk.jpg",
            fit: BoxFit.cover, height: double.infinity, width: double.infinity), 
      ),*/
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    MaterialApp(
        home: Scaffold(
        body: Image.asset("lib/images/dk.jpg",
          fit: BoxFit.cover, height: double.infinity, width: double.infinity),
    ));
  }
}
