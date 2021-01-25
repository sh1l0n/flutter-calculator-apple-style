//
// Created by sh1l0n
// Copyright Author 2021 All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'numer_pad_button.dart';

class NumberPad extends StatefulWidget {
   const NumberPad({
    Key key, 
    @required this.padSize,
    @required this.defaultOrderButtons,
    @required this.buttonStyle,
    @required this.onKeyPressed,
    @required this.disabledSymbolsStream}) 
  : super(key: key);

  final List<int> padSize;
  final List<List<String>> defaultOrderButtons;
  final Sink<String> onKeyPressed;
  final Stream<List<String>> disabledSymbolsStream;
  final NumerPadButtonStyle buttonStyle;

  @override
  State<StatefulWidget> createState() => _NumberPadState();
}

class _NumberPadState extends State<NumberPad> {

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [];
    for (final List<String> row in widget.defaultOrderButtons) {
      for (final String column in row) {
        final button = NumberPadButton(
          text: column,
          style: widget.buttonStyle,
          onTap: widget.onKeyPressed,
          disabledSymbolsStream: widget.disabledSymbolsStream,
        );
        buttons.add(button);
      }
    }

    return Material(
      type: MaterialType.transparency,
      child: Container(
        width: widget.buttonStyle.base.size.width * widget.padSize[0],
        height: widget.buttonStyle.base.size.height * widget.padSize[1],
        child: GridView.count(
          crossAxisCount: 4, // 4 columns
          children: buttons,
        ),
      ),
    );
  }
}