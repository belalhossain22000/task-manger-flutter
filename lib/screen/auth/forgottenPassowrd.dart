import 'package:flutter/material.dart';

class ForgottenPassowrdScreen extends StatefulWidget {
  const ForgottenPassowrdScreen({super.key});

  @override
  State<ForgottenPassowrdScreen> createState() =>
      _ForgottenPassowrdScreenState();
}

class _ForgottenPassowrdScreenState extends State<ForgottenPassowrdScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2ECC71), Color(0xFF0A1D37)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 60),

                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),

                const SizedBox(height: 20),

                const Icon(Icons.lock_reset, size: 80, color: Colors.white),
                const SizedBox(height: 16),

                const Text(
                  "Forgot Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Enter your email to receive an OTP",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70),
                ),

                const SizedBox(height: 40),

                TextField(
                  controller: emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: _inputDecoration("Email", Icons.email),
                ),

                const SizedBox(height: 30),

                GestureDetector(
                  onTap: () {
                    // TODO: call SEND OTP API
                    Navigator.pushNamed(context, '/verifyOtp');
                  },
                  child: _primaryButton("SEND OTP"),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Back to Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _primaryButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: const LinearGradient(
          colors: [Color(0xFF0A1D37), Color(0xFF102A43)],
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.white70),
      prefixIcon: Icon(icon, color: Colors.white),
      filled: true,
      fillColor: Colors.white.withOpacity(0.15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }
}
