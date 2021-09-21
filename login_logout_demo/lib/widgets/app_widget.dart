import 'package:flutter/material.dart';
import 'package:login_logout_demo/controllers/login_switch_controller.dart';
import 'package:login_logout_demo/models/user_model.dart';
import 'package:login_logout_demo/pages/home_page.dart';
import 'package:login_logout_demo/pages/login_page.dart';
import 'package:login_logout_demo/services/login_service.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: LoginSwitchController.instance.themeSwitch,
      builder: (context, isDark, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: LoginService().getUser(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    strokeWidth: 3.0,
                  ),
                );
              case ConnectionState.none:
                return LoginView();
              default:
                if ((snapshot.data as UserModel).name.isNotEmpty) {
                  return HomeView(snapshot.data as UserModel);
                } else {
                  return LoginView();
                }
            }
          },
        ),
        theme: ThemeData(
            brightness: isDark as bool ? Brightness.dark : Brightness.light),
        routes: {
          '/login': (_) => LoginView(),
        },
      ),
    );
  }
}
