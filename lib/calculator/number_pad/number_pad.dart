//
// Created by sh1l0n
// Copyright © 2019 iRobot Corporation All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'numer_pad_button.dart';

class NumberPadWidget extends StatefulWidget {
   const NumberPadWidget({
    Key key, 
    @required this.buttonStyle,
    @required this.onKeyPressed}) 
  : super(key: key);

  final Sink<String> onKeyPressed;
  final NumerPadButtonStyle buttonStyle;

  @override
  State<StatefulWidget> createState() => _NumberPadWState();
}

class _NumberPadWState extends State<NumberPadWidget> {

  static final List<int> padSize = [4, 5];
  static final List<List<String>> defaultOrderButtons = [
    ["+/-", "%", "/", "<"],
    ["7", "8", "9", "x"],
    ["4", "5", "6", "-"],
    ["1", "2", "3", "+"],
    ["C", "0", ".", "="],
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [];
    for (final List<String> row in defaultOrderButtons) {
      for (final String column in row) {
        final button = NumberPadButtonWidget(
          text: column,
          isEnabled: true,
          style: widget.buttonStyle,
          onTap: widget.onKeyPressed,
        );
        buttons.add(button);
      }
    }

    return Material(
      type: MaterialType.transparency,
      child: Container(
        width: widget.buttonStyle.base.size.width * padSize[0],
        height: widget.buttonStyle.base.size.height * padSize[1],
        child: GridView.count(
          crossAxisCount: 4, // 4 columns
          children: buttons,
        ),
      ),
    );
  }
}