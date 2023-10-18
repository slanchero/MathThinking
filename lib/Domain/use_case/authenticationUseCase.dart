import 'package:get/get.dart';
import 'package:maththinkingv2/Data/userDatasource.dart';
import 'package:maththinkingv2/Domain/Models/user.dart';

class AuthenticationUseCase {
  final UserDataSource _userDataSource = UserDataSource();

  Future<User> login(String email, String password) async {
    if (await _userDataSource.exists({"email": email, "password": password})) {
      print("si existe");
      User user = await _userDataSource.getUser(email);
      return Future.value(user);
    } else {
      return Future.error("Credenciales Incorrectas");
    }
  }

  Future<bool> signUp(User user, String password) async {
    var created = await _userDataSource.addUser(user, password);

    if (created == true) {
      return Future.value(true);
    } else {
      return Future.error('Usuario no creado');
    }
  }
}
