import 'package:doctor/model/doctor_model.dart';
import 'package:flutter/material.dart';

import '../screens/detail_screen.dart';
import '../screens/home_page_screen.dart';
import '../screens/splash_screen.dart';
import '../widgets/custom_route_widget.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (_) => const SplashScreen(),
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

  static Route? onGenerateRoute(RouteSettings settings) {
  final List<String> pathElements = settings.name!.split('/');
  if (pathElements[0] != '' || pathElements.length == 1) {
    return null; // Return null for unrecognized routes
  }
  switch (pathElements[1]) {
    case "DetailPage":
      return CustomRoute<bool>(
        builder: (BuildContext context) => DetailScreen(
          // model: settings.arguments,
          model: DoctorModel(name: 'name', type: 'type', description: 'description', rating: 3.2, goodReviews: 3.2, totalScore: 5.0, satisfaction: 1.3, isfavourite: true, image: 'image'),
        ),
        settings: settings, // Pass the received settings
      );
  }
  return null;
}

}
