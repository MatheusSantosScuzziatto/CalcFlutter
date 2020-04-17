import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _resultado = 0;
  TextEditingController texto1 = new TextEditingController();
  TextEditingController texto2 = new TextEditingController();
  TextEditingController resultado = new TextEditingController();

  void _calcula(String operador) {
    setState(() {
      int vl1 = int.parse(texto1.text);
      int vl2 = int.parse(texto2.text);
      if(operador == "+") {
        _resultado = (vl1 + vl2).toDouble();
      } else if(operador == "-") {
        _resultado = (vl1 - vl2).toDouble();
      } else if(operador == "*") {
        _resultado = (vl1 * vl2).toDouble();
      } else if(operador == "/") {
        _resultado = (vl1 / vl2);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: new SingleChildScrollView(
        child: new Container(
          margin: new EdgeInsets.all(25),
          child: new Form(child: buildForm(context),),
        ),
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    return new Column(
      children: <Widget>[
        new TextFormField(
          controller : texto1,
          decoration: new InputDecoration(hintText: "0"),
          maxLines: 1,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.numberWithOptions(),
        ),
        new TextFormField(
          controller : texto2,
          decoration: new InputDecoration(hintText: "0"),
          maxLines: 1,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.numberWithOptions(),
        ),

        new FloatingActionButton(
          onPressed: () => _calcula("+"),
          child: Icon(Icons.add),
        ),
        new FloatingActionButton(
          onPressed: () => _calcula("-"),
          child: Icon(Icons.remove),
        ),
        new FloatingActionButton(
          onPressed: () => _calcula("*"),
          child: Icon(Icons.close),
        ),
        new FloatingActionButton(
          onPressed: () => _calcula("/"),
          child: Icon(Icons.do_not_disturb_alt),
        ),

        new TextFormField(
          controller : resultado,
          decoration: new InputDecoration(hintText: _resultado.toString()),
          maxLines: 1,
          textAlign: TextAlign.center,
          enabled: false,
        )
      ],
    );
  }
}
