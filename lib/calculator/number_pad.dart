//
// Created by sh1l0n
// Copyright © 2019 iRobot Corporation All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NumberPadWidget extends StatefulWidget {
   const NumberPadWidget({
    Key key, 
    @required this.size,
    @required this.onKeyPressed}) 
  : super(key: key);

  final Sink<RawKeyEvent> onKeyPressed;
  final Size size;

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
      width: widget.size.width,
      height: widget.size.height,
      color: Colors.amber,
    );
  }
}