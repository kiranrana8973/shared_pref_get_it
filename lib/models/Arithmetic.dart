class Arithmetic {
  final int first;
  final int second;

  Arithmetic({
    required this.first,
    required this.second,
  });

  int add() {
    return first + second;
  }

  int sub() {
    return first - second;
  }
}
