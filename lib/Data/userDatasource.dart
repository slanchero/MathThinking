import 'dart:convert';

import 'package:loggy/loggy.dart';
import 'package:maththinkingv2/Domain/Models/user.dart';
import 'package:http/http.dart' as http;

class UserDataSource {
  final String apiKey = "s9n0IF";

  Future<User> getUser(String email) async {
    User user;

    final queryParameters = {
      'email': '$email',
    };

    var headers = {
      "format": 'json',
    };

    var request = Uri.https('retoolapi.dev', "$apiKey/data", queryParameters);

    var response = await http.get(request, headers: headers);

    if (true) {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        user = User.fromJson(data[0]);
      } else {
        logError("Got error code ${response.statusCode}");
        return Future.error('Error code ${response.statusCode}');
      }
    }

    return Future.value(user);
  }

  Future<bool> addUser(User user, String password) async {
    logInfo("Web service, Adding user");

    bool creado = false;

    if (await exists({"email": user.email}) == false) {
      Map<String, dynamic> body = user.toJson();
      body["password"] = password;

      final response = await http.post(
        Uri.parse("https://retoolapi.dev/$apiKey/data"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 201) {
        creado = true;
      } else {
        logError("Got error code ${response.statusCode}");
        return Future.error('Error code ${response.statusCode}');
      }
    } else {
      return Future.error("Correo en uso");
    }

    return Future.value(creado);
  }

  Future<bool> exists(Map<String, dynamic> queryParameters) async {
    bool existe;

    var headers = {
      "format": 'json',
    };

    var request = Uri.https('retoolapi.dev', "$apiKey/data", queryParameters);

    var response = await http.get(request, headers: headers);

    if (true) {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        existe = data.length > 0 ? true : false;
      } else {
        logError("Got error code ${response.statusCode}");
        return Future.error('Error code ${response.statusCode}');
      }
    }

    return Future.value(existe);
  }

  Future<bool> updateUser(Map<String, dynamic> data, int id) async {
    final response = await http.patch(
      Uri.parse("https://retoolapi.dev/$apiKey/data/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return Future.value(true);
    } else {
      logError("Update Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }
}
