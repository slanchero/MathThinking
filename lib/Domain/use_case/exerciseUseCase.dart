import '../Models/exercise.dart';
import 'dart:math';

class ExerciseUseCase {
  final int level;

  ExerciseUseCase({this.level = 1});

  List<Exercise> generateExerciseList(int level) {
    List<Exercise> exerciseList = [];
    Random _random = Random();

    int minDigitos;
    int maxDigitos;

    for (int i = 0; i < 6; i++) {
      MathOperator operator;
      switch (level) {
        case 1:
          operator = MathOperator.addition;
          minDigitos = 0;
          maxDigitos = 2;
          break;
        case 2:
          operator =
              i % 2 == 0 ? MathOperator.addition : MathOperator.subtraction;
          minDigitos = 1;
          maxDigitos = 2;
          break;
        case 3:
          operator =
              i % 2 == 0 ? MathOperator.addition : MathOperator.subtraction;
          minDigitos = 2;
          maxDigitos = 3;
          break;
        case 4:
          operator = i % 3 == 0
              ? MathOperator.addition
              : i % 3 == 1
                  ? MathOperator.subtraction
                  : MathOperator.multiplication;
          minDigitos = 1;
          maxDigitos = 2;
          break;
        case 5:
          operator = i % 4 == 0
              ? MathOperator.addition
              : i % 4 == 1
                  ? MathOperator.subtraction
                  : i % 4 == 2
                      ? MathOperator.multiplication
                      : MathOperator.division;
          minDigitos = 2;
          maxDigitos = 2;
          break;
        default:
          throw ArgumentError('Nivel no válido');
      }

      print("Min=$minDigitos");
      print("Max=$maxDigitos");

      int op1 = (_random.nextInt(
                  (pow(10, maxDigitos) - pow(10, minDigitos)).toInt()) +
              pow(10, minDigitos))
          .toInt();
      int op2 = (_random.nextInt(
                  (pow(10, maxDigitos) - pow(10, minDigitos)).toInt()) +
              pow(10, minDigitos))
          .toInt();

      int result;
      switch (operator) {
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
            result = op1 ~/ op2;
          } else {
            throw ArgumentError('No se puede dividir por cero');
          }
          break;
      }

      exerciseList.add(Exercise(
        op1: op1,
        op2: op2,
        sign: operator,
        result: result,
      ));
    }

    return exerciseList;
  }

  List<dynamic> calculateNewLevel(int currentLevel, Map map) {
    int correctAnswers = 0;
    int incorrectAnswers = 0;
    double timeTaken = 0;

    map.forEach((key, value) {
      key.result == value[0] ? correctAnswers++ : incorrectAnswers++;
      timeTaken += value[1];
    });

    double score = correctAnswers * 15 - incorrectAnswers * 5 - timeTaken;

    print("time=$timeTaken");
    print("score=$score");

    int newLevel = currentLevel;

    if (score >= 30) {
      newLevel = currentLevel + 1;
    } else if (score <= 0 && currentLevel > 1) {
      newLevel = currentLevel - 1;
    }

    newLevel = newLevel.clamp(1, 5);

    return [correctAnswers, incorrectAnswers, timeTaken, newLevel];
  }
}
