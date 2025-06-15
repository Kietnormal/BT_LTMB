// lib/screens/auth_gate.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uth_smarttasks/screens/login_screen.dart';
import 'package:uth_smarttasks/screens/profile_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Nếu người dùng chưa đăng nhập
        if (!snapshot.hasData) {
          return const LoginScreen();
        }
        // Nếu người dùng đã đăng nhập
        return ProfileScreen(user: snapshot.data!);
      },
    );
  }
}