import 'package:calculadora/botoes/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math' as math;

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = "";
  var useAnswer = "";

  // final myTextStyle = TextStyle(fontSize: 30, color: Colors.deepPurple[900]);

  final List<String> buttons = [
    "C",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "*",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "ANS",
    "="
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                        //padding: EdgeInsets.all(20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          userQuestion,
                          style: TextStyle(fontSize: 50),
                        )),
                    Container(
                        //padding: EdgeInsets.all(20.0),
                        alignment: Alignment.centerRight,
                        child: Text(useAnswer, style: TextStyle(fontSize: 50)))
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    // ignore: missing_return
                    itemBuilder: (BuildContext context, int index) {
                      //Limpar Botão.
                      if (index == 0) {
                        return Buttons(
                          buttonTapped: () {
                            setState(() {
                              userQuestion = "";
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.green,
                          textColor: Colors.white,
                        );

                        //Botão de Delete.
                      } else if (index == 1) {
                        return Buttons(
                          buttonTapped: () {
                            setState(() {
                              userQuestion = userQuestion.substring(
                                  0, userQuestion.length - 1);
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.red,
                          textColor: Colors.white,
                        );
                      }

                      //Botão Igual
                      else if (index == buttons.length - 1) {
                        return Buttons(
                          buttonTapped: () {
                            setState(() {
                              equalPressed();
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.red,
                          textColor: Colors.white,
                        );

                        //Resto dos Botões.
                      } else {
                        return Buttons(
                          buttonTapped: () {
                            setState(() {
                              // userQuestion = userQuestion + buttons[index];
                              userQuestion += buttons[index];
                            });
                          },
                          buttonText: buttons[index],
                          color: isOperator(buttons[index])
                              ? Colors.deepPurple
                              : Colors.deepPurple[50],
                          textColor: isOperator(buttons[index])
                              ? Colors.white
                              : Colors.deepPurple,
                        );
                      }
                    }),
                /* child: Center(
                  child: Buttons(
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    buttonText: "0",
                  ),
                ), */
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == "%" || x == "/" || x == "*" || x == "-" || x == "+" || x == "=") {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll("x", "*");

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    useAnswer = eval.toString();
  }
}
