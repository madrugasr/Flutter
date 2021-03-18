import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {}

  final String usuario;

  const Dashboard({Key key, this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(usuario),
      ),
      appBar: AppBar(
        title: Text(usuario),
      ),
    );
  }
}
