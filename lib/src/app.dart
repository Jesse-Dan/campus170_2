import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_notification/in_app_notification.dart';

import 'routes/routes.dart';
import 'utils/style/app_theme.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {return
          InAppNotification(
            child: MaterialApp(
                theme: AppTheme.lightThemeData(context),
                darkTheme: AppTheme.darkThemeData(context),
                themeMode: ThemeMode.dark,
                onGenerateRoute: (RouteSettings routeSettings) =>
                    AppRoutes.getRoutes(routeSettings)),
          );
        });
  }
}
