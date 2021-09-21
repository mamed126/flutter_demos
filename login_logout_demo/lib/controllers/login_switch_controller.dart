import 'package:flutter/material.dart';
import 'package:login_logout_demo/contracts/switcher_contract.dart';
import 'package:login_logout_demo/models/login_switch_model.dart';
import 'package:login_logout_demo/services/switch_button_service.dart';

class LoginSwitchController {
  LoginSwitchController._() {
    storage.getK('dark').then((val) {
      themeSwitch.value = val;
    });
  }
  static final instance = LoginSwitchController._();

  final config = LoginSwitchModel();
  bool get isDark => config.themeSwitch.value;
  ValueNotifier get themeSwitch => config.themeSwitch;
  final ISwitchButton storage = SwitchButtonServices();

  Future<void> changeTheme(value) async {
    themeSwitch.value = value;
    storage.put('dark', value);
  }
}
