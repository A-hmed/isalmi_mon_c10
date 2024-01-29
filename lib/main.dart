import 'package:flutter/material.dart';
import 'package:isalmi_mon_c10/ui/screens/home/home_screen.dart';
import 'package:isalmi_mon_c10/ui/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        HomeScreen.routeName: (_) => const HomeScreen()
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}