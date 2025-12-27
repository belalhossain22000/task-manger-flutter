import 'package:flutter/material.dart';
import 'package:task_manager/screen/auth/forgottenPassowrd.dart';
import 'package:task_manager/screen/auth/loginScreen.dart';
import 'package:task_manager/screen/auth/registration.dart';
import 'package:task_manager/screen/auth/resetPasswordScreen.dart';
import 'package:task_manager/screen/auth/verifyOtpScreen.dart';
import 'package:task_manager/screen/home/homeScreen.dart';
import 'package:task_manager/screen/onboarding/splashScreen.dart';
import 'package:task_manager/screen/profile/edit_profile_screen.dart';
import 'package:task_manager/screen/profile/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/registration': (context) => RegistrationScreen(),
        '/forgottenPassword': (context) => ForgottenPassowrdScreen(),
        '/verifyOtp': (context) => VerifyOtpScreen(),
        '/changePassword': (context) => ResetPasswordScreen(),
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/editProfile': (context) => EditProfileScreen(),
      },
    );
  }
}
