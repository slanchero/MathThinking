enum MathOperator {
  addition,
  subtraction,
  multiplication,
  division,
}

class Exercise {
  Exercise({
    required this.op1,
    required this.op2,
    required this.sign,
    required this.result,
  });

  Exercise.calcResult({
    required this.op1,
    required this.op2,
    required this.sign,
  }) {
    switch (sign) {
      case MathOperator.addition:
        result = op1 + op2;
        break;
      case MathOperator.subtraction:
        result = op1 - op2;
        break;
      case MathOperator.multiplication:
        result = op1 * op2;
        break;
      case MathOperator.division:
        if (op2 != 0) {
          result = op1 ~/ op2; // División entera
        } else {
          throw ArgumentError('No se puede dividir por cero');
        }
        break;
    }
  }

  int op1;
  int op2;
  MathOperator sign;
  int result = 0;

  String get operacion => '$op1 ${getOperatorSymbol()} $op2';

  String getOperatorSymbol({MathOperator? operator}) {
    switch (operator ?? this.sign) {
      case MathOperator.addition:
        return '+';
      case MathOperator.subtraction:
        return '-';
      case MathOperator.multiplication:
        return '*';
      case MathOperator.division:
        return '/';
    }
  }
}
