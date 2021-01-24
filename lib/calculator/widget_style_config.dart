//
// Created by sh1l0n
// Copyright © 2019 iRobot Corporation All rights reserved.
//

import 'package:flutter/material.dart';

class TextStyleConfig {
  const TextStyleConfig({ 
    @required this.size, 
    @required this.weight, 
    @required this.color,
    @required this.family,
    @required this.package,
  });

  final double size;
  final FontWeight weight;
  final Color color;
  final String family;
  final String package;
}

class WidgetStyleConfig {
  const WidgetStyleConfig({
    @required this.normalColor, 
    @required this.highlightColor, 
    @required this.disableColor,
    @required this.size,
  });

  final Color normalColor;
  final Color highlightColor;
  final Color disableColor;
  final Size size;
}