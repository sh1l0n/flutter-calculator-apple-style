//
// Created by sh1l0n
// Copyright © 2019 iRobot Corporation All rights reserved.
//

import 'dart:async';
import 'dart:math';

import 'package:flutter/widgets.dart';

import 'brain.dart';
import 'display.dart';
import 'number_pad/number_pad.dart';
import 'number_pad/numer_pad_button.dart';

class CalculatorStyle {
  const CalculatorStyle({
    @required this.backgroundColor,
    @required this.display, 
    @required this.button,
  });

  final DisplayStyle display;
  final NumerPadButtonStyle button;
  final Color backgroundColor;
}

class Calculator extends StatefulWidget {
  const Calculator({
    Key key, 
    @required this.brain,
    @required this.style
  }) : super(key: key);

  final CalculatorStyle style;
  final Brain brain;

  @override
  State<StatefulWidget> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  StreamController<String> _calculatorController;
  Stream<String> get _stream => _calculatorController.stream;
  Sink<String> get _sink => _calculatorController.sink;

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
      widget.style.button.base.size.width * widget.brain.padSize[0],
      widget.style.display.height + widget.style.button.base.size.height*widget.brain.padSize[1],
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
              final values = widget.brain.compute(snapshot.data, 32);
              final number = values[0];
              final disabledSymbols = values [1];

              print("snapshot.data " + snapshot.data);
              print("number " + number);
              print("disabledSymbols ${disabledSymbols.toString()}");
              return Display(
                width: size.width,
                text: number,
                style: widget.style.display,
              );
          }),
          NumberPad(
            padSize: widget.brain.padSize,
            defaultOrderButtons: widget.brain.defaultOrderButtons,
            buttonStyle: widget.style.button,
            onKeyPressed: _sink,
          ),
        ],
      ),
    );
  }
}