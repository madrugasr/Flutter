import 'package:flutter/material.dart';
import 'services/api_client.dart';
import 'widgets/drop_down.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  //Instância para a API Cliente.
  ApiClient client = ApiClient();
  //Configuração de Cores.
  Color mainColor = Color(0xFF212936);
  Color secundColor = Color(0xFF2849E5);

  //Configuração das Variaveis.
  List<String> currencies;
  String from;
  String to;

  //Variaveis para Taxa de Intercâmbio.
  double rate;
  String result = "";

  //Função de ligação com API.
  Future<List<String>> getCurrencyList() async {
    return await client.getCurrencies();
  }

  @override
  void initState() {
    super.initState();
    (() async {
      List<String> list = await client.getCurrencies();
      setState(() {
        currencies = list;
      });
    })();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                width: 200,
                child: Text(
                  "Conversor de Moedas",
                  style: TextStyle(
                    //height: 1,
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                  child: Center(
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Definir o Text Field.
                        TextField(
                          onSubmitted: (value) async {
                            //Agora vamos fazer a função para obter a taxa de Câmbio.
                            rate = await client.getRate(from, to);
                            setState(() {
                              result = (rate * double.parse(value))
                                  .toStringAsFixed(2);
                            });
                          },
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Valor para Conversão",
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                  color: secundColor)),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          //textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Criando widget para as OCORRÊNCIAS.
                            customDropDown(currencies, from, (val) {
                              setState(() {
                                from = val;
                              });
                            }),
                            FloatingActionButton(
                              onPressed: () {
                                String temp = from;
                                setState(() {
                                  from = to;
                                  to = temp;
                                });
                              },
                              child: Icon(Icons.swap_horiz),
                              elevation: 0,
                              backgroundColor: secundColor,
                            ),
                            customDropDown(currencies, to, (val) {
                              setState(() {
                                to = val;
                              });
                            }),
                          ],
                        ),
                        SizedBox(height: 50),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              /* Text(
                              "Resultado",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ), */
                              Text(result,
                                  style: TextStyle(
                                      color: secundColor,
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        )
                      ]),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
