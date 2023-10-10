import 'package:flutter/material.dart';

import '../screens/detail_screen.dart';
import '../screens/home_page_screen.dart';
import '../screens/splash_screen.dart';
import '../widgets/custom_route_widget.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (_) => SplashScreen(),
      '/HomePage': (_) => const HomePageScreen(),
    };
  }

  // static Route onGenerateRoute(RouteSettings settings) {
  //   final List<String> pathElements = settings.name!.split('/');
  //   if (pathElements[0] != '' || pathElements.length == 1) {
  //     return 'null';
  //   }
  //   switch (pathElements[1]) {
  //     case "DetailPage":
  //       return CustomRoute<bool>(
  //         builder: (BuildContext context) => DetailScreen(
  //           model: settings.arguments,
  //         ), settings: null,
  //       );
  //   }
  // }
}
