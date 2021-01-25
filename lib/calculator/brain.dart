
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

  final _symbolKeys = {
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

  String __computeOperationStack() {
    
  }


  String compute(String symbol, int maxLength) {
    
    if (!_symbolKeys.containsKey(symbol)) {
      return value;
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
        _operationStack.add(value);
        _value = __computeOperationStack();
        _operationStack = [];
        _history += "=;" + value + "\n";
        break;
      case _BrainTypes.remove:
        break;
      case _BrainTypes.dot:
        break;
      case _BrainTypes.number:
        _value += symbol;
        break;
    }
    
    return value;
  }
}