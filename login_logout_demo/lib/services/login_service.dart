import 'dart:convert';

import 'package:login_logout_demo/contracts/login_contract.dart';
import 'package:login_logout_demo/models/user_model.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginService extends LoginAbs {
  @override
  Future<UserModel> login(String email, String password) async {
    final api = Uri.parse('https://reqres.in/api/login');
    final data = {"email": email, "password": password};
    // final dio = Dio();
    http.Response response;
    response = await http.post(api, body: data);
    if (response.statusCode == 200) {
      SharedPreferences storage = await SharedPreferences.getInstance();
      final body = json.decode(response.body);
      await storage.setString('TOKEN', body['token']);
      await storage.setString('EMAIL', email);
      return UserModel(email, body['token']);
    } else {
      return UserModel("", "");
    }
  }

  @override
  Future<UserModel> getUser() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final token = storage.getString('TOKEN');
    final email = storage.getString('EMAIL');
    if (token != null && email != null) {
      return UserModel(email, token);
    } else {
      return UserModel("", "");
    }
  }

  @override
  Future<bool> logout() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final email = storage.getString('EMAIL');
    final token = storage.getString('TOKEN');
    if (email != null && token != null) {
      await storage.remove('TOKEN');
      await storage.remove('EMAIL');
      return true;
    } else {
      return false;
    }
  }
}
