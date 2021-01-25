//
// Created by sh1l0n
// Copyright © 2019 iRobot Corporation All rights reserved.
//

import 'package:flutter/material.dart';

import '../common/widget_style_config.dart';
import 'number_pad/number_pad_button_painter.dart';

class DisplayWidgetStyle {
  const DisplayWidgetStyle({
    @required this.height,
    @required this.color, 
    @required this.horizontalMargin,
    @required this.textStyle,
    @required this.cornerRadius, 
    @required this.strokeWidth, 
    @required this.strokeColor, 
  });

  final double height;
  final Color color;
  final TextStyleConfig textStyle;
  final double horizontalMargin;
  final double cornerRadius;
  final double strokeWidth;
  final Color strokeColor;
}

class DisplayWidget extends StatelessWidget {
  const DisplayWidget({
    Key key, 
    @required this.width,
    @required this.text,
    @required this.style, 
  }) 
  : super(key: key);

  final String text;
  final double width;
  final DisplayWidgetStyle style;

  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: style.height,
      color: style.color,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(width, style.height),
            painter: NumberPadButtonPainter(
              style: PainterStyleConfig(
                cornerRadius: style.cornerRadius,
                fillColor: style.color,
                strokeColor: style.strokeColor,
                strokeWidth: style.strokeWidth,
              ),
            ),
          ),
          Center(
            child: Container(
              width: width,
              height: style.height,
              child: Center(
                child: Text(
                  text,
                  maxLines: 1,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: style.textStyle.size,
                    fontWeight: style.textStyle.weight,
                    color: style.textStyle.color,
                    fontFamily: style.textStyle.family,
                    package: style.textStyle.package,
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