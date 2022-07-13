import 'package:flutter/material.dart';
import 'package:flutter_home_assignment/values/strings.dart';

import 'locator.dart';
import 'routes.dart';
import 'services/navigation_service.dart';
import 'values/app_colors.dart';

class DemoDesignApp extends StatelessWidget {
  const DemoDesignApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.colorPrimary,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: AppColors.colorAccent),
        unselectedWidgetColor: AppColors.colorPrimary,
      ),
      initialRoute: AppStrings.questionsScreen,
      routes: Routes.routes,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
