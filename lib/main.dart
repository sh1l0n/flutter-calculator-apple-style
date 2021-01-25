

import 'package:flutter/material.dart';

import 'calculator/brain.dart';
import 'calculator/calculator.dart';
import 'calculator/display.dart';
import 'calculator/number_pad/numer_pad_button.dart';
import 'common/widget_style_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      home: MyHomePage(title: 'Flutter Calculator'),
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

  @override
  Widget build(BuildContext context) {

    final buttonStyle = NumerPadButtonStyle(
      base: ContainerStyleConfig(
        normalColor: Colors.black38, 
        highlightColor: Colors.lightBlueAccent,
        disableColor: Colors.blueGrey,
        size: Size(50, 50),
      ),
      text: TextStyleConfig(
        size: 18,
        color: Color(0xffffffff),
        family: "Arial-MT",
        weight: FontWeight.normal,
        package: "",
      ),
      cornerRadius: 0, 
      strokeWidth: 1, 
      strokeColor: Colors.black45,
    );

    final displayStyle = DisplayStyle(
      color: Colors.black12,
      cornerRadius: 0,
      horizontalMargin: 8,
      height: 40,
      strokeColor: Colors.black45,
      strokeWidth: 1,
      textStyle: TextStyleConfig(
        size: 20,
        color: Colors.black,
        family: "Arial-MT",
        weight: FontWeight.normal,
        package: "",
      )
    );
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Calculator(
          brain: Brain(),
          style: CalculatorStyle(
            backgroundColor: Colors.grey,
            display: displayStyle,
            button: buttonStyle,
          ),
        ),
      ),
    );
  }
}
