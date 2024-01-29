import 'package:flutter/material.dart';
import 'package:isalmi_mon_c10/ui/screens/home/home_screen.dart';

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
    print("Init state");
    Future.delayed(Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: Image.asset("assets/images/splash.png"),
    );
  }
}
