//
// Created by sh1l0n
// Copyright © 2019 iRobot Corporation All rights reserved.
//

import 'package:flutter/material.dart';

import '../common/widget_style_config.dart';
import 'number_pad/number_pad_button_painter.dart';

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

class DisplayWidget extends StatelessWidget {
  const DisplayWidget({
    Key key, 
    @required this.text,
    @required this.style, 
  }) 
  : super(key: key);

  final String text;
  final DisplayWidgetStyle style;

  Widget build(BuildContext context) {
    return Container(
      width: style.size.width,
      height: style.size.height,
      color: style.color,
      child: Stack(
        children: [
          CustomPaint(
            size: style.size,
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
              width: style.size.width,
              height: style.size.height,
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