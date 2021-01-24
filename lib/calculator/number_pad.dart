//
// Created by sh1l0n
// Copyright © 2019 iRobot Corporation All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_calc/calculator/widget_style_config.dart';

class NumberPadWidget extends StatefulWidget {
   const NumberPadWidget({
    Key key, 
    @required this.buttonStyle,
    @required this.textStyle,
    @required this.onKeyPressed}) 
  : super(key: key);

  final Sink<RawKeyEvent> onKeyPressed;
  final ContainerStyleConfig buttonStyle;
  final TextStyleConfig textStyle;

  @override
  State<StatefulWidget> createState() => _NumberPadWState();
}

class _NumberPadWState extends State<NumberPadWidget> {

  static final List<int> padSize = [5, 3];
  static final List<List<String>> defaultOrderButtons = [
    ["+/-", "%", "/", "<"],
    ["7", "8", "9", "x"],
    ["4", "5", "6", "-"],
    ["1", "2", "3", "+"],
    ["C", "0", ".", "="],
  ];

  @override
  Widget build(BuildContext context) {


    return Container(
      width: widget.buttonStyle.size.width * padSize[0],
      height: widget.buttonStyle.size.height * padSize[1],
      color: Colors.amber,
    );
  }
}