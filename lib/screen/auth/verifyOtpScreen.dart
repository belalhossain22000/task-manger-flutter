import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController otpController = TextEditingController();
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
            colors: [
              Color(0xFF2ECC71), // Green
              Color(0xFF0A1D37), // Navy
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
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
                const Icon(Icons.verified_user, size: 80, color: Colors.white),

                const SizedBox(height: 16),

                /// Title
                const Text(
                  "Verify OTP",
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
                  "Enter the 6-digit code sent to your email",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),

                const SizedBox(height: 40),

                /// OTP Input
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  cursorColor: Colors.white,
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 50,
                    fieldWidth: 45,
                    inactiveColor: Colors.white54,
                    activeColor: Colors.white,
                    selectedColor: Colors.white,
                    activeFillColor: Colors.white.withOpacity(0.15),
                    selectedFillColor: Colors.white.withOpacity(0.2),
                    inactiveFillColor: Colors.white.withOpacity(0.1),
                  ),
                  enableActiveFill: true,
                  onChanged: (value) {},
                ),

                const SizedBox(height: 30),

                /// Verify Button
                GestureDetector(
                  onTap: isLoading
                      ? null
                      : () {
                          setState(() => isLoading = true);

                      
                         // TODO: call SEND OTP API
                          Navigator.pushNamed(context, '/resetPassword');

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
                              "VERIFY OTP",
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

                /// Resend OTP
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Didn't receive the code?",
                      style: TextStyle(color: Colors.white70),
                    ),
                    TextButton(
                      onPressed: () {
                        // TODO: resend OTP
                      },
                      child: const Text(
                        "Resend",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
