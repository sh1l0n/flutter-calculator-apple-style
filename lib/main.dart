//
// Created by sh1l0n
// Copyright Author 2021 All rights reserved.
//

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
        normalColor: Color(0xffe0e0e0), 
        highlightColor: Color(0xffbababa),
        disableColor: Color(0xffffffff),
        size: Size(50, 50),
      ),
      text: TextStyleConfig(
        size: 16,
        color: Color(0xff000000),
        family: "Lucia Console",
        weight: FontWeight.normal,
        package: "",
      ),
      cornerRadius: 0, 
      strokeWidth: 1, 
      strokeColor: Colors.black45,
    );

    final displayStyle = DisplayStyle(
      color: Color(0xff4c4c4c),
      cornerRadius: 0,
      horizontalMargin: 4,
      height: 40,
      strokeColor: Color(0xff131313),
      strokeWidth: 1,
      textStyle: TextStyleConfig(
        size: 24,
        color: Color(0xffffffff),
        family: "Lucida Console",
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
          maxCharacters: 14,
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
