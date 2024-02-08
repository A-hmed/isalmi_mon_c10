import 'package:flutter/material.dart';
import 'package:isalmi_mon_c10/ui/screens/hadeth_details/hadeth_details.dart';
import 'package:isalmi_mon_c10/ui/screens/home/home_screen.dart';
import 'package:isalmi_mon_c10/ui/screens/splash/splash_screen.dart';
import 'package:isalmi_mon_c10/ui/screens/sura_details/sura_details.dart';

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
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetails.routeName: (_) => SuraDetails(),
        HadethDetails.routeName: (_) => HadethDetails()
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}