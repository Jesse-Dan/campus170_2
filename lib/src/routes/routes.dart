import 'package:flutter/material.dart';
import 'package:navigation_system/navigation_system.dart';

import '../utils/components/web_view.dart';
import '../view/app/splash_screen.dart';

class AppRoutes {
  static getRoutes(RouteSettings routeSettings) => NavigationSystem(
        initialRoute: const SplashScreenView(),
        routes: {
          SplashScreenView.routeName: (context, args) =>
              const SplashScreenView(),
          AppWebView.routeName: (context, args) => AppWebView(
                url: args?.arguments[0]['url'],
              ),
        },
      ).generateRoute(routeSettings);
}
