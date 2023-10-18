import 'dart:convert';

import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:maththinkingv2/Controller/authenticationController.dart';
import 'package:maththinkingv2/Controller/userController.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Domain/Models/exercise.dart';
import '../Domain/Models/user.dart';
import '../Domain/use_case/exerciseUseCase.dart';

class ExerciseController extends GetxController {
  int nivelActual = 1;

  late int nivelAnterior;
  final ExerciseUseCase exerciseUseCase = Get.find();

  final UserController userController = Get.find();

  late User _usuario;

  final Stopwatch _stopwatch = Stopwatch();

  final Map<Exercise, List> _map = Map();

  final _index = 0.obs;

  final _answ = "".obs;

  final RxList<Exercise> _exercises = <Exercise>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadAuthenticatedUser();
  }

  void usuario(User user) {
    _usuario = user;
    getExercises();
  }

  getExercises() {
    logInfo("Getting Exercises");
    _exercises.value =
        exerciseUseCase.generateExerciseList(_usuario.difficulty);
    _exercises.value.forEach((element) {
      print(element.operacion);
    });
    start();
    print(_usuario.difficulty);
  }

  String get exercise =>
      _exercises.isEmpty ? "0" : _exercises[_index.value].operacion;

  Exercise get _exercise => _exercises[_index.value];

  int get index => _index.value;

  String get answ => _answ.value;

  increment() => _index.value++;

  addAnsw(String text) => _answ.value += text;

  reset() => _answ.value = "";

  start() => _stopwatch.start();

  stop() => _stopwatch.stop();

  finishOne() {
    stop();
    print(answ);
    print(_stopwatch.elapsed);
    List<int> list = [
      int.parse(answ == "" ? "0" : answ),
      _stopwatch.elapsed.inSeconds
    ];
    _map.addAll({_exercise: list});
    _stopwatch.reset();
    reset();
    start();
    index == 5 ? finish() : increment();
  }

  finish() async {
    final prefs = await SharedPreferences.getInstance();
    List list = exerciseUseCase.calculateNewLevel(nivelActual, _map);
    _index.value = 0;
    nivelAnterior = nivelActual;
    nivelActual = list[3];
    _usuario.difficulty = nivelActual;
    _usuario.lastLoginDate = DateTime.now();
    await prefs.setString(AuthenticationController.updateDateKey,
        _usuario.lastLoginDate.toIso8601String());
    print("date actualizacion ${_usuario.lastLoginDate}");
    await prefs.setString(AuthenticationController.authenticatedUserKey,
        json.encode(_usuario.toJson()));
    print(nivelActual);
    getExercises();
    logInfo(_usuario.email);
    _map.clear();
    Get.toNamed(
        "/results/?buenas=${list[0]}&malas=${list[1]}&tiempo${list[2]}&nan=${nivelAnterior}&nac=${nivelActual}");
  }

  Future<void> loadAuthenticatedUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson =
        prefs.getString(AuthenticationController.authenticatedUserKey);
    if (userJson != null) {
      _usuario = User.fromJson(json.decode(userJson));
      logInfo(_usuario.email);
      //_email.value = _usuario.email;
      nivelActual = _usuario.difficulty;
      getExercises();
    }
  }

  Future<void> saveAuthenticatedUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AuthenticationController.authenticatedUserKey,
        json.encode(user.toJson()));
  }
}
