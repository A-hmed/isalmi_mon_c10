import 'package:flutter/material.dart';
import 'package:isalmi_mon_c10/ui/screens/home/home_screen.dart';
import 'package:isalmi_mon_c10/ui/utils/app_assets.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash_screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Image.asset(AppAssets.splash),
    );
  }
}
