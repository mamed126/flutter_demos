import 'package:login_logout_demo/models/user_model.dart';

abstract class LoginAbs {
  Future<UserModel> login(String email, String password);

  Future<UserModel> getUser();

  Future<bool> logout();
}
