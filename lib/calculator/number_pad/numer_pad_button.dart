//
// Created by sh1l0n
// Copyright Author 2021 All rights reserved.
//


import 'dart:async';

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

class NumberPadButton extends StatefulWidget {
  const NumberPadButton({
    Key key, 
    @required this.text, 
    @required this.style,
    @required this.onTap,
    @required this.disabledSymbolsStream,
  }) : super(key: key);

  final String text;
  final NumerPadButtonStyle style;
  final Sink<String> onTap;
  final Stream<List<String>> disabledSymbolsStream;
  
  @override
  State<StatefulWidget> createState() => _NumerPadButtonState();
}

class _NumerPadButtonState extends State<NumberPadButton> {

  StreamController<_NumberPadButtonWidgetState> _buttonController;
  Stream<_NumberPadButtonWidgetState> get _stream => _buttonController.stream;
  Sink<_NumberPadButtonWidgetState> get _sink => _buttonController.sink;

  bool _isEnabled;
  @override
  void initState() {
    super.initState();
    _buttonController = StreamController<_NumberPadButtonWidgetState>.broadcast();

    _isEnabled = true;
    widget.disabledSymbolsStream.listen((List<String> disabledSymbols) {
        _isEnabled = ! disabledSymbols.contains(widget.text);
        _sink.add(_isEnabled ? _NumberPadButtonWidgetState.NORMAL : _NumberPadButtonWidgetState.DISABLED);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _buttonController.close();
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        _handleTap(true);
      },
      onTapUp: (TapUpDetails details) {
        _handleTap(false);
      },
      onTapCancel: () {
        _handleTap(false);
      },
      dragStartBehavior: DragStartBehavior.down,
      // child: Container(
      //   width: widget.style.base.size.width,
      //   width: widget.style.base.size.width,
      // )
      child: StreamBuilder(
        initialData: _NumberPadButtonWidgetState.NORMAL,
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot<_NumberPadButtonWidgetState> data) {
          if (!data.hasData) {
            return Container();
          } 
          return _NumberPadButtonWidget(
            text: widget.text,
            state: data.data,
            style: widget.style,
          );
          
        })
    );
  }

  void _handleTap(final bool isTapDown) {
    if (_isEnabled) {
      if (_sink != null) {
        _sink.add(isTapDown ? _NumberPadButtonWidgetState.HIGHLIGHTED : _NumberPadButtonWidgetState.NORMAL);
      }
      if (!isTapDown && widget.onTap!=null) {
        widget.onTap.add(widget.text);
      }
    } else {
      if (_sink != null) {
        _sink.add(_NumberPadButtonWidgetState.DISABLED);
      }
    }
  }
}

enum _NumberPadButtonWidgetState {
  NORMAL,
  HIGHLIGHTED,
  DISABLED
}

class _NumberPadButtonWidget extends StatelessWidget {
  const _NumberPadButtonWidget({
    Key key, 
    @required this.text, 
    @required this.state, 
    @required this.style
  }) : super(key: key);

  final String text;
  final _NumberPadButtonWidgetState state;
  final NumerPadButtonStyle style;

  @override
  Widget build(BuildContext context) {
    final colors = {
      _NumberPadButtonWidgetState.NORMAL: style.base.normalColor,
      _NumberPadButtonWidgetState.HIGHLIGHTED: style.base.highlightColor,
      _NumberPadButtonWidgetState.DISABLED: style.base.disableColor,
    };
    final color = colors[state];
    
    return Container(
      width: style.base.size.width,
      height: style.base.size.height,
      color: Color(0xffff0000),
      child: Stack(
        children: [
          CustomPaint(
            size: style.base.size,
            painter: NumberPadButtonPainter(
              style: PainterStyleConfig(
                cornerRadius: style.cornerRadius,
                fillColor: color,
                strokeColor: style.strokeColor,
                strokeWidth: style.strokeWidth,
              ),
            ),
          ),
          Center(
            child: Container(
              width: style.base.size.width,
              height: style.base.size.height,
              child: Center(
                child: Text(
                  text,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: style.text.size,
                    fontWeight: style.text.weight,
                    color: style.text.color,
                    fontFamily: style.text.family,
                    package: style.text.package,
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