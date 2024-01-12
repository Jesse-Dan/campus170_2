import 'package:campus170_2/src/view/auth/login/login.dart';
import 'package:flutter/material.dart';
import 'package:navigation_system/navigation_system.dart';

import '../utils/components/web_view.dart';
import '../view/auth/splash_screen/splash_screen.dart';

class AppRoutes {
  static getRoutes(RouteSettings routeSettings) => NavigationSystem(
        initialRoute: const SplashScreenView(),
        routes: {
          SplashScreenView.routeName: (context, args) =>
              const SplashScreenView(),
              LoginView.routeName: (context, args) =>
              const LoginView(),
          AppWebView.routeName: (context, args) => AppWebView(
                url: args?.arguments[0]['url'] ??
                    'https://via.placeholder.com/320x180',
              ),
        },
      ).generateRoute(routeSettings);
}
