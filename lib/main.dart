import 'package:doctor/theme/theme.dart';
import 'package:flutter/material.dart';

import 'config/route.dart';





void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Health Care App',
      theme:AppTheme.lightTheme,
      // routes: Routes.getRoute(),
      //   onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
     
    );
  }
}

