import 'package:get/get.dart';
import 'package:maththinkingv2/Data/userDatasource.dart';

import '../Models/user.dart';

class UserUseCase {
  final UserDataSource _userDatatasource = UserDataSource();

  Future<User> getUser(String email) async =>
      await _userDatatasource.getUser(email);

  Future<bool> addUser(User user, String password) async =>
      await _userDatatasource.addUser(user, password);

  Future<bool> updateUser(Map<String, dynamic> data, int id) async =>
      await _userDatatasource.updateUser(data, id);
}
