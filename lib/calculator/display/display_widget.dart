//
// Created by sh1l0n
// Copyright © 2019 iRobot Corporation All rights reserved.
//

import 'package:flutter/material.dart';

import '../../common/widget_style_config.dart';
import '../number_pad/number_pad_button_painter.dart';

class DisplayWidgetStyle {
  const DisplayWidgetStyle({
    @required this.size,
    @required this.color, 
    @required this.horizontalMargin,
    @required this.textStyle,
    @required this.cornerRadius, 
    @required this.strokeWidth, 
    @required this.strokeColor, 
  });

  final Size size;
  final Color color;
  final TextStyleConfig textStyle;
  final double horizontalMargin;
  final double cornerRadius;
  final double strokeWidth;
  final Color strokeColor;
}

class DisplayWidget extends StatefulWidget {
  const DisplayWidget({
    Key key, 
    @required this.style, 
  }) 
  : super(key: key);

  final DisplayWidgetStyle style;

  @override
  State<StatefulWidget> createState() => _DisplayWidgetState();
}

class _DisplayWidgetState extends State<DisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.style.size.width,
      height: widget.style.size.height,
      color: widget.style.color,
      child: Stack(
        children: [
          CustomPaint(
            size: widget.style.size,
            painter: NumberPadButtonPainter(
              style: PainterStyleConfig(
                cornerRadius: widget.style.cornerRadius,
                fillColor: widget.style.color,
                strokeColor: widget.style.strokeColor,
                strokeWidth: widget.style.strokeWidth,
              ),
            ),
          ),
          Center(
            child: Container(
              width: widget.style.size.width,
              height: widget.style.size.height,
              child: Center(
                child: Text(
                  "0123mkdaldmlasm askldnm",
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: widget.style.textStyle.size,
                    fontWeight: widget.style.textStyle.weight,
                    color: widget.style.textStyle.color,
                    fontFamily: widget.style.textStyle.family,
                    package: widget.style.textStyle.package,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}