
import 'package:flutter/material.dart';

enum _BrainTypes {
  clear,
  sign,
  perc,
  mul,
  div,
  sum,
  sub,
  equals,
  dot,
  number,
  remove,
}


class Brain {

  List<int> get padSize => [4, 5];
  List<List<String>> get defaultOrderButtons => [
    ["+/-", "%", "/", "<"],
    ["7", "8", "9", "x"],
    ["4", "5", "6", "-"],
    ["1", "2", "3", "+"],
    ["C", "0", ".", "="],
  ];

  final Map<String, _BrainTypes> _symbolKeys = {
    "C": _BrainTypes.clear,
    "+/-": _BrainTypes.sign,
    "%": _BrainTypes.perc,
    "/": _BrainTypes.div,
    "7": _BrainTypes.number, 
    "8": _BrainTypes.number,
    "9": _BrainTypes.number,
    "x": _BrainTypes.mul,
    "4": _BrainTypes.number,
    "5": _BrainTypes.number,
    "6": _BrainTypes.number,
    "-": _BrainTypes.sub,
    "1": _BrainTypes.number,
    "2": _BrainTypes.number,
    "3": _BrainTypes.number,
    "+": _BrainTypes.sum,
    "0": _BrainTypes.number,
    ".": _BrainTypes.dot,
    "=": _BrainTypes.equals,
    "<": _BrainTypes.remove
  };

  String _value = "";
  String get value => _value;
  double get valueDouble {
    try {
      return double.parse(value);
    } catch (e) {
      return 0;
    }
  }

  List<String> _operationStack = [];
  // List<String> get operationStack => _operationStack;

  String _history = "";
  // String get history => _history; 

  static List<String> getDisabledSymbols(final String number, final List<String> operationStack,  final Map<String, _BrainTypes> symbolKeys, final int maxCharacters) {
    List<String> symbols = [];
    double numberDouble = double.tryParse(number);
    if (numberDouble == 0.0) {
      symbols += (number=="0" ? ["0", "C"] : []);
      symbols += ["+", "-", "x", "/", "%", "+/-"];
      symbols += (number.contains(".") ? []: ["<"]);
      if (operationStack.isEmpty) {
        symbols += ["="];
      } 
    }
    if (number.contains(".") || number.contains("e") || number.length>maxCharacters-2) {
      symbols += ["."];
    } 
    if (number.length>=maxCharacters-1) {
      symbols += ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "+/-"];
    }
    return symbols;
  }

  static String _computeOperationStack(final List<String> operationStack, final Map<String, _BrainTypes> symbolKeys) {
    if (operationStack.length<2) {
      return "";
    }

    double result = 0;
    int index = 0;
    while (index < operationStack.length) {
      final symbol = operationStack[index];

      try {
        final number = double.parse(symbol);
        result += number;
        index += 1;
      } catch(Exception) {
        final symbolKey = symbolKeys[symbol];
        try {
          final nextSymbol = operationStack[index+1];
          final nextSymbolDouble = double.parse(nextSymbol);
          switch (symbolKey) {
            case _BrainTypes.div: result /= nextSymbolDouble; break;
            case _BrainTypes.sum: result += nextSymbolDouble; break;
            case _BrainTypes.sub: result -= nextSymbolDouble; break;
            case _BrainTypes.mul: result *= nextSymbolDouble; break;
            default: break;
          }
          index += 2;
        } catch (Exception) {
          break;
        }
      }
    }

    final rString = result.toString();
    final rSeparator = rString.contains("e") ? "e" : ".";
    final rSplitted = rString.split(rSeparator);
    if (rSplitted.length==2 && int.parse(rSplitted[1])==0) {
      return result.toInt().toString();
    } else {
      return result.toString();
    }
  }

  static String _removeLast(final String number) {
    String newValue = number;
    if (number.length>0) {
      newValue = newValue.substring(0, newValue.length - 1);
      if (newValue.length == 0) {
        newValue = "0";
      } else if (newValue[newValue.length-1] == ".") {
        newValue = newValue.substring(0, newValue.length - 1);
      }
    } else {
      newValue = "0";
    }
    return newValue;
  }


  List compute(final String symbol, final int maxCharacters) {
    
    if (!_symbolKeys.containsKey(symbol)) {
      return [value, getDisabledSymbols(value, _operationStack, _symbolKeys, maxCharacters)];
    }
    final symbolKey = _symbolKeys[symbol];
    switch (symbolKey) {
      case _BrainTypes.clear:
        _value = "0";
        _operationStack = [];
        _history += "\n";
        break;
      case _BrainTypes.sign:
        _value = (valueDouble * -1).toString();
        break;
      case _BrainTypes.perc:
        _value = (valueDouble / 100).toString();
        break;
      case _BrainTypes.div:
      case _BrainTypes.sum: 
      case _BrainTypes.sub:
      case _BrainTypes.mul:
        _operationStack.add(value);
        _operationStack.add(symbol);
        _history += _value + ";" + symbol + ";";
        _value = "0";
        break;
      case _BrainTypes.equals:
        if (_operationStack.length>1) {
          _operationStack.add(_value);
          final result = _computeOperationStack(_operationStack, _symbolKeys);
          _value = result=="" ? value : result;
          _operationStack = result=="" ? _operationStack : [];
          _history = result=="" ? "" : ("=;" + value + "\n");
        }
        break;
      case _BrainTypes.remove:
        if (value.contains("e")) {
          final vSplitted = value.split("e");
          final newValue = _removeLast(vSplitted[0]);
          _value  += (value == "0" ? "0" : newValue + "e" + vSplitted[1]);
        } else {
          _value = _removeLast(value);
        }
        break;
      case _BrainTypes.dot:
        _value += (value.contains(symbol) || value.contains("e"))  ? "" : symbol;
        break;
      case _BrainTypes.number:
        if (value.contains("e")) {
          final vSplitted = value.split("e");
          _value = vSplitted[0] + (vSplitted[0].length==1 ? "." : "") + symbol + "e" + vSplitted[1];

        } else {
          _value = value=="0" ? symbol : (value + symbol);
        }
        break;
    }

    return [value, getDisabledSymbols(value, _operationStack, _symbolKeys, maxCharacters)];
  }
}