class ApiConfig {
  static const String baseUrl = "http://10.0.30.141:3000/api/v1";

  // Auth
  static const String login = "/auth/login";
  static const String register = "/users/register";
  static const String forgotPassword = "/auth/forgot-password";
  static const String verifyOtp = "/auth/verify-otp";
  static const String resetPassword = "/auth/reset-password";

  // Example protected route
  static const String profile = "/users/me";
}
