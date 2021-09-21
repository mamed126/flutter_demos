import 'package:flutter/material.dart';
import 'package:login_logout_demo/controllers/login_switch_controller.dart';

class LoginSwitchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: LoginSwitchController.instance.isDark,
      onChanged: (value) {
        LoginSwitchController.instance.changeTheme(value);
      },
    );
  }
}
