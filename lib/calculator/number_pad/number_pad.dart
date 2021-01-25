//
// Created by sh1l0n
// Copyright Author 2021 All rights reserved.
//

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'numer_pad_button.dart';

class NumberPad extends StatefulWidget {
   const NumberPad({
    Key key, 
    @required this.padSize,
    @required this.defaultOrderButtons,
    @required this.buttonStyles,
    @required this.onKeyPressed,
    @required this.disabledSymbolsStream}) 
  : super(key: key);

  final List<int> padSize;
  final List<List<String>> defaultOrderButtons;
  final Sink<String> onKeyPressed;
  final Stream<List<String>> disabledSymbolsStream;
  final Map<String, NumerPadButtonStyle> buttonStyles;

  @override
  State<StatefulWidget> createState() => _NumberPadState();
}

class _NumberPadState extends State<NumberPad> {

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [];

    double width = 0;
    double height = 0;
    for (final List<String> row in widget.defaultOrderButtons) {

      double _width = 0;
      double _height = 0;
      for (final String column in row) {
        final buttonStyle = widget.buttonStyles[column];
        _width += buttonStyle.base.size.width;
        _height = max(_height, buttonStyle.base.size.height);
        final button = NumberPadButton(
          text: column,
          style: buttonStyle,
          onTap: widget.onKeyPressed,
          disabledSymbolsStream: widget.disabledSymbolsStream,
        );
        buttons.add(button);
      }
      width = max(_width, width);
      height += _height;
    }

    return Material(
      type: MaterialType.transparency,
      child: Container(
        width: width,
        height: height,
        child: GridView.count(
          crossAxisCount: 4, // 4 columns
          children: buttons,
        ),
      ),
    );
  }
}