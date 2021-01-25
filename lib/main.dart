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


  NumerPadButtonStyle _generateButtonStyle(final Size buttonSize, final ContainerStyleConfig style, final Color textColor) {
    final textStyle =  TextStyleConfig(
        size: 16,
        color: textColor,
        family: "Lucia Console",
        weight: FontWeight.normal,
        package: "",
    );

    final buttonStyle = NumerPadButtonStyle(
      base: style,
      text: textStyle,
      cornerRadius: 0, 
      strokeWidth: 1, 
      strokeColor: Colors.black45,
    );
    return buttonStyle;
  }

  Map<String, NumerPadButtonStyle> _generateButtonStyles(final Size buttonSize) {
    final _style1 = ContainerStyleConfig( // normal buttons
      normalColor: Color(0xffe0e0e0), 
      highlightColor: Color(0xffbababa),
      disableColor: Color(0xffffffff),
      size: buttonSize,
    );
    final _style2 = ContainerStyleConfig( // orange buttons
      normalColor: Color(0xfff59234), 
      highlightColor: Color(0xffd16a0a),
      disableColor: Color(0xfff8b06d),
      size: buttonSize,
    );
    final _style3 = ContainerStyleConfig( // gray buttons
      normalColor: Color(0xffb8b7b5), 
      highlightColor: Color(0xff969592),
      disableColor: Color(0xffcdcccb),
      size: buttonSize,
    );
    final style1 = _generateButtonStyle(buttonSize, _style1, Color(0xff000000));
    final style2 = _generateButtonStyle(buttonSize, _style2, Color(0xffffffff));
    final style3 = _generateButtonStyle(buttonSize, _style3, Color(0xff000000));

     final Map<String, NumerPadButtonStyle> buttonStyles = {
      "C": style1,
      "+/-": style3,
      "%": style3,
      "<": style2,
      "/": style3,
      "7": style1, 
      "8": style1,
      "9": style1,
      "x": style2,
      "4": style1,
      "5": style1,
      "6": style1,
      "-": style2,
      "1": style1,
      "2": style1,
      "3": style1,
      "+": style2,
      "0": style1,
      ".": style1,
      "=": style2,
    };
    return buttonStyles;
  }

  @override
  Widget build(BuildContext context) {
    final buttonSize = Size(50, 50);
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
    final buttonStyles = _generateButtonStyles(buttonSize);

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
            buttons: buttonStyles,
            buttonSize: buttonSize,
          ),
        ),
      ),
    );
  }
}
