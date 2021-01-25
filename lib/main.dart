import 'package:flutter/material.dart';
import 'package:flutter_calc/calculator/number_pad.dart';

import 'calculator/numer_pad_button.dart';
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

    final textStyle = TextStyleConfig(
      size: 18,
      color: Color(0xffffffff),
      family: "Arial-MT",
      weight: FontWeight.normal,
      package: "",
    );
    final buttonStyle = NumerPadButtonStyle(
      normalColor: Color(0xffff00ff), 
      highlightColor: Color(0x0000ffff),
      disableColor: Color(0x00ff00ff),
      size: Size(50, 50),
      cornerRadius: 10, 
      strokeWidth: 3, 
      strokeColor: Color(0xffffffff)
    );
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: NumberPadWidget(
          buttonStyle: buttonStyle,
          textStyle: textStyle,
          onKeyPressed: null,
        ),
      )
    );
  }
}
