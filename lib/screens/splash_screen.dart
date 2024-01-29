import 'package:find_my_pet/gen/assets.gen.dart';
import 'package:find_my_pet/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4)).then(
      (_) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Lottie.asset(Assets.animations.splash)),
    );
  }
}
