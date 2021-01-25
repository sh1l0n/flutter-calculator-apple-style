//
// Created by sh1l0n
// Copyright © 2019 iRobot Corporation All rights reserved.
//

import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' show CustomPainter;

import '../../common/widget_style_config.dart';


class NumberPadButtonPainter extends CustomPainter {
  NumberPadButtonPainter({
    @required this.style
  }) {
    
    _fillPaint.style = PaintingStyle.fill;
    _fillPaint.color = style.fillColor;

    _strokePaint.style = PaintingStyle.stroke;
    _strokePaint.color = style.strokeColor;
    _strokePaint.strokeWidth = style.strokeWidth;
    _strokePaint.isAntiAlias = true;
  }

  final Paint _fillPaint = Paint();
  final Paint _strokePaint = Paint();
  final PainterStyleConfig style;

  @override
  void paint(Canvas canvas, Size size) {
    if (size == Size.zero) {
      return;
    }
    final frame = Rect.fromLTWH(0, 0, size.width, size.height);
    final frameRounded = RRect.fromRectAndRadius(frame, Radius.circular(style.cornerRadius));
    canvas.drawRRect(frameRounded, _fillPaint);
    canvas.drawRRect(frameRounded, _strokePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}