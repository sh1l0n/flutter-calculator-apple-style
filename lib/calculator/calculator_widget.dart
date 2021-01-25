//
// Created by sh1l0n
// Copyright © 2019 iRobot Corporation All rights reserved.
//

import 'dart:math';

import 'package:flutter/widgets.dart';

import 'display/display_widget.dart';
import 'number_pad/number_pad.dart';
import 'number_pad/numer_pad_button.dart';

class CalculatorWidgetStyle {
  const CalculatorWidgetStyle({
    @required this.backgroundColor,
    @required this.display, 
    @required this.button,
  });

  final DisplayWidgetStyle display;
  final NumerPadButtonStyle button;
  final Color backgroundColor;
}

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({
    Key key, 
    @required this.style
  }) : super(key: key);

  final CalculatorWidgetStyle style;

  @override
  State<StatefulWidget> createState() => _CalculatorState();
}

class _CalculatorState extends State<CalculatorWidget> {

  @override
  Widget build(BuildContext context) {

    final size = Size(
      max(widget.style.display.size.width, widget.style.button.base.size.width),
      widget.style.display.size.height + widget.style.button.base.size.height*5,
    );

    return Container(
      width: size.width,
      height: size.height,
      color: widget.style.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DisplayWidget(
            style: widget.style.display,
          ),
          NumberPadWidget(
            buttonStyle: widget.style.button,
            onKeyPressed: null,
          ),
        ],
      ),
    );
  }
}