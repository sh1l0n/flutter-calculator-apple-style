//
// Created by sh1l0n
// Copyright © 2019 iRobot Corporation All rights reserved.
//

import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_calc/calculator/widget_style_config.dart';

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
  final ContainerStyleConfig widgetStyleConfig;
  final TextStyleConfig textStyleConfig;
  final Sink<String> onTap;
  
  @override
  State<StatefulWidget> createState() => _NumerPadButtonState();
}

// enum NumerPadButtonAction {
//   NORMAL,
//   PRESSED,
//   DISABLED
// }

class _NumerPadButtonState extends State<NumberPadButtonWidget> {

  // final StreamController<NumerPadButtonAction> _colo

  void handleTouch() {
    if (widget.isEnabled) {
      print("handleTouch " + widget.text);
      // widget.onTap.add(widget.text);
    }
  }

  @override
  Widget build(BuildContext context) {

    final Color color = widget.isEnabled ? widget.widgetStyleConfig.normalColor : widget.widgetStyleConfig.disableColor;

    return GestureDetector(
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
        color: color,
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