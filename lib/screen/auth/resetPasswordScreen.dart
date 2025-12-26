import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isNewPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF2ECC71), Color(0xFF0A1D37)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),

                /// Back Button
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                const SizedBox(height: 30),

                /// Icon
                const Icon(Icons.lock_outline, size: 80, color: Colors.white),

                const SizedBox(height: 16),

                /// Title
                const Text(
                  "Set New Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 8),

                /// Subtitle
                const Text(
                  "Create a strong password for your account",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70),
                ),

                const SizedBox(height: 40),

                /// New Password
                _passwordField(
                  controller: newPasswordController,
                  hint: "New Password",
                  isVisible: isNewPasswordVisible,
                  onToggle: () {
                    setState(() {
                      isNewPasswordVisible = !isNewPasswordVisible;
                    });
                  },
                ),

                const SizedBox(height: 16),

                /// Confirm Password
                _passwordField(
                  controller: confirmPasswordController,
                  hint: "Confirm Password",
                  isVisible: isConfirmPasswordVisible,
                  onToggle: () {
                    setState(() {
                      isConfirmPasswordVisible = !isConfirmPasswordVisible;
                    });
                  },
                ),

                const SizedBox(height: 30),

                /// Save Button
                GestureDetector(
                  onTap: isLoading
                      ? null
                      : () {
                          setState(() => isLoading = true);

                          // TODO: call RESET PASSWORD API
                           Navigator.pushNamed(context, '/login');

                          Future.delayed(const Duration(seconds: 1), () {
                            setState(() => isLoading = false);
                          });
                        },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF0A1D37), Color(0xFF102A43)],
                      ),
                    ),
                    child: Center(
                      child: isLoading
                          ? const SizedBox(
                              height: 22,
                              width: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              "SAVE PASSWORD",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Password Field with Eye Toggle
  Widget _passwordField({
    required TextEditingController controller,
    required String hint,
    required bool isVisible,
    required VoidCallback onToggle,
  }) {
    return TextField(
      controller: controller,
      obscureText: !isVisible,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70),
        prefixIcon: const Icon(Icons.lock, color: Colors.white),
        suffixIcon: IconButton(
          icon: Icon(
            isVisible ? Icons.visibility_off : Icons.visibility,
            color: Colors.white,
          ),
          onPressed: onToggle,
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
