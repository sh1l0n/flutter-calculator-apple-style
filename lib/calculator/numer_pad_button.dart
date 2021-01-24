//
// Created by sh1l0n
// Copyright © 2019 iRobot Corporation All rights reserved.
//

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_calc/calculator/text_utils.dart';

class NumberPadButtonWidget extends StatefulWidget {
  const NumberPadButtonWidget({
    Key key, 
    @required this.text, 
    @required this.isEnabled,
    @required this.widgetStyleConfig,
    @required this.textStyleConfig,
    @required this.onTap
  }) : super(key: key);

  final String text;
  final bool isEnabled;
  final WidgetStyleConfig widgetStyleConfig;
  final TextStyleConfig textStyleConfig;
  final Sink<String> onTap;
  
  @override
  State<StatefulWidget> createState() => _NumerPadButtonState();
}

class _NumerPadButtonState extends State<NumberPadButtonWidget> {

  void handleTouch() {
    if (widget.isEnabled) {
      widget.onTap.add(widget.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        handleTouch();
      },
      onTapUp: (TapUpDetails details) {
        handleTouch();
      },
      onTapCancel: () {
        handleTouch();
      },
      dragStartBehavior: DragStartBehavior.down,
      child: Container(
        width: widget.widgetStyleConfig.size.width,
        height: widget.widgetStyleConfig.size.height,
        child: Stack(
          children: [
            Container(
              width: widget.widgetStyleConfig.size.width,
              height: widget.widgetStyleConfig.size.height,
              child: Text(
                widget.text,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: widget.textStyleConfig.size,
                  fontWeight: widget.textStyleConfig.weight,
                  color: widget.textStyleConfig.color,
                  fontFamily: widget.textStyleConfig.family,
                  package: widget.textStyleConfig.package,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}