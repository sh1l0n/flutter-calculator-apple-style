//
// Created by sh1l0n
// Copyright © 2019 iRobot Corporation All rights reserved.
//

import 'dart:async';
import 'dart:math';

import 'package:flutter/widgets.dart';

import 'display_widget.dart';
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

  StreamController<String> _calculatorController;
  Stream<String> get _stream => _calculatorController.stream;
  Sink<String> get _sink => _calculatorController.sink;

  final List<int> padSize = [4, 5];
  final List<List<String>> defaultOrderButtons = [
    ["+/-", "%", "/", "<"],
    ["7", "8", "9", "x"],
    ["4", "5", "6", "-"],
    ["1", "2", "3", "+"],
    ["C", "0", ".", "="],
  ];

  @override
  void initState() {
    super.initState();
    _calculatorController = StreamController<String>.broadcast();
  }

  @override
  void dispose() {
    super.dispose();
    _calculatorController.close();
  }

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
          StreamBuilder(
            initialData: "0",
            stream: _stream,
            builder: (BuildContext c, AsyncSnapshot<String> snapshot) {
              return DisplayWidget(
                text: snapshot.data,
                style: widget.style.display,
              );
          }),
          NumberPadWidget(
            padSize: padSize,
            defaultOrderButtons: defaultOrderButtons,
            buttonStyle: widget.style.button,
            onKeyPressed: _sink,
          ),
        ],
      ),
    );
  }
}