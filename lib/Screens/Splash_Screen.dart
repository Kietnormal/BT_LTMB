import 'package:flutter/material.dart';
import 'package:smart_task/Screens/forgot_password_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ForgotPasswordScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/image 1.png', height: 100),
            const SizedBox(height: 20),
            const Text(
              'UTH SmartTasks',
              style: TextStyle(
                fontSize: 30,
                color: Color(0xFF006EE9),
                fontWeight: FontWeight.bold,
                fontFamily: 'Arial',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
