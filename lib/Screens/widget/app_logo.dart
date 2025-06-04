import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/image 1.png'),
        Container(width: 80, height: 80, alignment: Alignment.center),
        const Text(
          'SmartTasks',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF007BFF),
          ),
        ),
      ],
    );
  }
}
