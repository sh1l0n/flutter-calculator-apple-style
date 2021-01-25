
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

  final symbolKeys = {
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

  String _current = "";
  String get current => _current;

  List<String> _operationStack = [];
  List<String> get operationStack => _operationStack;

  String _history = "";
  String get history => _history; 

  String compute(String symbol, int maxLength) {
    return current;
  }
}