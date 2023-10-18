import 'dart:convert';

import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:maththinkingv2/Controller/exerciseController.dart';
import 'package:maththinkingv2/Controller/userController.dart';
import 'package:maththinkingv2/Domain/Models/user.dart';
import 'package:maththinkingv2/Domain/use_case/authenticationUseCase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController extends GetxController {
  UserController userController = Get.find();

  ExerciseController exerciseController = Get.find();

  static const String loggedInKey = 'loggedIn';

  static const String loginDateKey = 'DateCloud';

  static const String updateDateKey = 'DateLocal';

  static const String authenticatedUserKey = 'authenticatedUser';

  User? authenticatedUser;

  final logged = false.obs;

  bool get isLogged => logged.value;

  @override
  void onInit() {
    super.onInit();
    //saveLoggedInState(false);
    loadLoggedInState();
    loadAuthenticatedUser();
  }

  Future<void> loadLoggedInState() async {
    final prefs = await SharedPreferences.getInstance();
    logged.value = prefs.getBool(loggedInKey) ?? false;
    print(logged.value);
  }

  Future<void> saveLoggedInState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(loggedInKey, value);
  }

  Future<void> loadAuthenticatedUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(authenticatedUserKey);
    if (userJson != null) {
      authenticatedUser = User.fromJson(json.decode(userJson));
      userController.updateUser(json.decode(userJson), authenticatedUser!.id!);
    }
  }

  Future<void> saveAuthenticatedUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(authenticatedUserKey, json.encode(user.toJson()));
  }

  Future<void> saveLoginDate(DateTime date) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(loginDateKey, date.toIso8601String());
  }

  Future<void> saveUpdateDate(DateTime date) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(updateDateKey, date.toIso8601String());
  }

  Future<void> login(String email, String password) async {
    final AuthenticationUseCase authentication = Get.find();
    User usuario = await authentication.login(email, password);
    logInfo("Dificultad=${usuario.difficulty}");
    exerciseController.usuario(usuario);
    logged.value = true;
    //print("logged=$logged");
    await saveAuthenticatedUser(usuario);
    await saveLoggedInState(true);
    await saveLoginDate(DateTime.now());
    final prefs = await SharedPreferences.getInstance();
    final fecha1Str = await prefs.getString(loginDateKey);
    print("date login ${DateTime.parse(fecha1Str ?? '')}");
    await exerciseController.loadAuthenticatedUser();
  }

  Future<bool> signUp(String email, String password, String firstName,
      String lastName, String school) async {
    final AuthenticationUseCase authentication = Get.find();
    logInfo('Controller Sign Up');
    User user = new User(
        firstName: firstName, lastName: lastName, email: email, school: school);
    await authentication.signUp(user, password);
    return true;
  }

  Future<void> logOut() async {
    final prefs = await SharedPreferences.getInstance();

    final fecha1Str = await prefs.getString(loginDateKey);
    final fecha2Str = await prefs.getString(updateDateKey);

    if (fecha1Str != null && fecha2Str != null) {
      final fecha1 = DateTime.parse(fecha1Str);
      final fecha2 = DateTime.parse(fecha2Str);

      print("facha1=$fecha1Str y fecha 2=$fecha2Str");

      await loadAuthenticatedUser();

      if (fecha1.isBefore(fecha2)) {
        userController.updateUser({
          "difficulty": authenticatedUser!.difficulty,
          "date": authenticatedUser!.lastLoginDate.toIso8601String()
        }, authenticatedUser!.id!);
        print("guardado");
      } else if (fecha1.isAfter(fecha2)) {
        print('fecha1 es posterior a fecha2');
      } else {
        print('fecha1 y fecha2 son iguales');
      }
      await loadAuthenticatedUser();
    }

    logged.value = false;
    authenticatedUser = null;
    await prefs.remove(authenticatedUserKey);
    await saveLoggedInState(false);
  }
}
