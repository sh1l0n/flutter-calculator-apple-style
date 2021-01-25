//
// Created by sh1l0n
// Copyright © 2019 iRobot Corporation All rights reserved.
//


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_calc/common/widget_style_config.dart';

import 'number_pad_button_painter.dart';

class NumerPadButtonStyle extends ContainerStyleConfig {
  NumerPadButtonStyle({
    @required Color normalColor, 
    @required Color highlightColor, 
    @required Color disableColor,
    @required Size size,
    this.cornerRadius, 
    this.strokeWidth, 
    this.strokeColor
  }): super(
    normalColor: normalColor,
    highlightColor: highlightColor,
    disableColor: disableColor,
    size: size
  );

  final double cornerRadius; 
  final double strokeWidth;
  final Color strokeColor;
}

class NumberPadButtonWidget extends StatefulWidget {
  const NumberPadButtonWidget({
    Key key, 
    @required this.text, 
    @required this.isEnabled,
    @required this.style,
    @required this.textStyle,
    @required this.onTap
  }) : super(key: key);

  final String text;
  final bool isEnabled;
  final NumerPadButtonStyle style;
  final TextStyleConfig textStyle;
  final Sink<String> onTap;
  
  @override
  State<StatefulWidget> createState() => _NumerPadButtonState();
}


class _NumerPadButtonState extends State<NumberPadButtonWidget> {

  void handleTouch() {
    if (widget.isEnabled) {
      print("handleTouch " + widget.text);
      // widget.onTap.add(widget.text);
    }
  }

  @override
  Widget build(BuildContext context) {

    final Color color = widget.isEnabled ? widget.style.normalColor : widget.style.disableColor;

    return GestureDetector(
      onTapUp: (TapUpDetails details) {
        handleTouch();
      },
      onTapCancel: () {
        handleTouch();
      },
      dragStartBehavior: DragStartBehavior.down,
      child: Container(
        width: widget.style.size.width,
        height: widget.style.size.height,
        color: color,
        child: Stack(
          children: [
            CustomPaint(
              size: widget.style.size,
              painter: NumberPadButtonPainter(
                style: PainterStyleConfig(
                  cornerRadius: widget.style.cornerRadius,
                  fillColor: color,
                  strokeColor: widget.style.strokeColor,
                  strokeWidth: widget.style.strokeWidth,
                ),
              ),
            ),
            Center(
              child: Container(
                width: widget.style.size.width,
                height: widget.style.size.height,
                child: Text(
                  widget.text,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: widget.textStyle.size,
                    fontWeight: widget.textStyle.weight,
                    color: widget.textStyle.color,
                    fontFamily: widget.textStyle.family,
                    package: widget.textStyle.package,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}