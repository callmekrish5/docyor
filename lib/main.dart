import 'package:doctor/theme/theme.dart';
import 'package:flutter/material.dart';

import 'config/route.dart';
import 'screens/home_page_screen.dart';





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Health Care App',
      theme:AppTheme.lightTheme,
      routes: Routes.getRoute(),
        // onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
        home: const HomePageScreen(),
     
    );
  }
}

