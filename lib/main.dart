import 'package:flutter/material.dart';
import 'package:flutter_calc/calculator/calculator_widget.dart';
import 'package:flutter_calc/calculator/display/display_widget.dart';
import 'package:flutter_calc/calculator/number_pad/number_pad.dart';

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
        normalColor: Color(0xffff00ff), 
        highlightColor: Color(0x0000ffff),
        disableColor: Color(0x00ff00ff),
        size: Size(50, 50),
      ),
      text: TextStyleConfig(
        size: 18,
        color: Color(0xffffffff),
        family: "Arial-MT",
        weight: FontWeight.normal,
        package: "",
      ),
      cornerRadius: 10, 
      strokeWidth: 3, 
      strokeColor: Color(0xffffffff)
    );

    final displayStyle = DisplayWidgetStyle(
      color: Color(0x00ff12ff),
      cornerRadius: 10,
      horizontalMargin: 8,
      size: Size(200, 40),
      strokeColor: Color(0x2255aaff),
      strokeWidth: 3,
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
        child: CalculatorWidget(
          style: CalculatorWidgetStyle(
            backgroundColor: Colors.red,
            display: displayStyle,
            button: buttonStyle,
          ),
        ),
      ),
    );
  }
}
