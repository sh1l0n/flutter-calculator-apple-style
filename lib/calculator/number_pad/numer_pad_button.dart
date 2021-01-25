//
// Created by sh1l0n
// Copyright © 2019 iRobot Corporation All rights reserved.
//


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_calc/common/widget_style_config.dart';

import 'number_pad_button_painter.dart';

class NumerPadButtonStyle {
  const NumerPadButtonStyle({
    @required this.base,
    @required this.text,
    @required this.cornerRadius, 
    @required this.strokeWidth, 
    @required this.strokeColor
  });

  final ContainerStyleConfig base;
  final TextStyleConfig text;
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
    @required this.onTap
  }) : super(key: key);

  final String text;
  final bool isEnabled;
  final NumerPadButtonStyle style;
  final Sink<String> onTap;
  
  @override
  State<StatefulWidget> createState() => _NumerPadButtonState();
}


class _NumerPadButtonState extends State<NumberPadButtonWidget> {
  bool _isTapDown;

  @override
  void initState() {
    super.initState();
    _isTapDown = false;
  }

  @override
  Widget build(BuildContext context) {

    final Color enabledColor = _isTapDown ? widget.style.base.highlightColor : widget.style.base.normalColor; 
    final Color color = widget.isEnabled ? enabledColor : widget.style.base.disableColor;

    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        _handleTap();
      },
      onTapUp: (TapUpDetails details) {
        _handleTap();
      },
      onTapCancel: () {
        _handleTap();
      },
      dragStartBehavior: DragStartBehavior.down,
      child: Container(
        width: widget.style.base.size.width,
        height: widget.style.base.size.height,
        child: Stack(
          children: [
            CustomPaint(
              size: widget.style.base.size,
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
                width: widget.style.base.size.width,
                height: widget.style.base.size.height,
                child: Center(
                  child: Text(
                    widget.text,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: widget.style.text.size,
                      fontWeight: widget.style.text.weight,
                      color: widget.style.text.color,
                      fontFamily: widget.style.text.family,
                      package: widget.style.text.package,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleTap() {
    if (widget.isEnabled) {
      setState(() {
        _isTapDown = false;
      });
      if (!_isTapDown && widget.onTap!=null) {
        widget.onTap.add(widget.text);
      }
    }
  }
}