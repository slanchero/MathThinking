import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:maththinkingv2/Domain/Models/user.dart';
import 'package:maththinkingv2/Domain/use_case/userUseCase.dart';

class UserController extends GetxController {
  final UserUseCase userUseCase = Get.find();

  Future<User> getUser(String email) async {
    logInfo("Getting user");
    return await userUseCase.getUser(email);
  }

  addUser(User user, String password) async {
    logInfo("Add user");
    await userUseCase.addUser(user, password);
  }

  updateUser(Map<String, dynamic> data, int id) async {
    logInfo("Update user");
    print("id update $id");
    await userUseCase.updateUser(data, id);
  }
}
