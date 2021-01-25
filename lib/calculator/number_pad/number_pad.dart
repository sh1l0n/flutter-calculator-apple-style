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

  final Sink<RawKeyEvent> onKeyPressed;
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

    // List<Widget> padRows = [];
    // for (final List<String> rowInfoButtons in defaultOrderButtons) {
    //   List<Widget> buttons = [];
    //   for (final String buttonTitle in rowInfoButtons) {
    //     final button = NumberPadButtonWidget(
    //       text: buttonTitle,
    //       isEnabled: true,
    //       textStyleConfig: widget.textStyle,
    //       widgetStyleConfig: widget.buttonStyle,
    //       onTap: null,
    //     );
    //     buttons.add(button);
    //   }
    //   final row = Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: buttons,
    //   );
    //   padRows.add(row);
    // }

    // return Container(
    //   width: widget.buttonStyle.size.width * padSize[0],
    //   height: widget.buttonStyle.size.height * padSize[1],
    //   color: Colors.amber,
    //   child:  Column(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween, 
    //     children: padRows,
    //   ),
    // );

    List<Widget> buttons = [];
    for (final List<String> row in defaultOrderButtons) {
      for (final String column in row) {
        final button = NumberPadButtonWidget(
          text: column,
          isEnabled: true,
          style: widget.buttonStyle,
          onTap: null,
        );
        buttons.add(button);
      }
    }

    return Material(
      type: MaterialType.transparency,
      child: Container(
        // margin: EdgeInsets.only(top: 230),
        margin: EdgeInsets.all(50),
        width: widget.buttonStyle.base.size.width * padSize[0],
        height: widget.buttonStyle.base.size.height * padSize[1],
        color: Colors.red,
        child: GridView.count(
          crossAxisCount: 4, // 4 columns
          children: buttons,
        ),
      ),
    );
  }
}