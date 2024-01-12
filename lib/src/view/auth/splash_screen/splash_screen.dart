import 'dart:async';

import 'package:campus170_2/src/view/auth/login/login.dart';
import 'package:campus170_2/src/view/base/base_body.dart';
import 'package:campus170_2/src/view/base/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:navigation_system/go/go.dart';

class SplashScreenView extends StatefulWidget {
  static const String routeName = 'auth.splashscreen.view';

  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  _SplashScreenViewState() {
    Timer(const Duration(seconds: 4), () {
      Go(context, routeName: LoginView.routeName).to();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      addbodyPadding: true,
      body: BaseBody(
        key: widget.key,
        child: Center(child: Image.asset('assets/images/app_logo.png')),
      ),
    );
  }
}
