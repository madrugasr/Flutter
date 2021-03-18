import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:verhutunh/screens/dashboard.dart';

void main() {
  runApp(VerhutunhApp());
}

class VerhutunhApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.brown,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.engineering,
                color: Colors.brown,
                size: 100.0,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(labelText: "Usuário"),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(labelText: "Senha"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),

                /* child: ElevatedButton(
                  child: Text("ENTRAR"),
                  style: ButtonStyle(backgroundColor: Colors.brown)
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Dashboard(
                                  usuario: "Daniel",
                                )));
                  },
                ), */
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Dashboard(
                                  usuario: "Daniel",
                                )));
                  },
                  child: Text("Entrar"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
