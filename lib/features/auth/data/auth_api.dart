import '../../../core/network/api_client.dart';
import '../../../core/network/api_config.dart';

class AuthApi {
  static Future<Map<String, dynamic>> login(String email, String password) {
    return ApiClient.post(ApiConfig.baseUrl + ApiConfig.login, {
      "email": email,
      "password": password,
    });
  }

  static Future<Map<String, dynamic>> forgotPassword(String email) {
    return ApiClient.post(ApiConfig.baseUrl + ApiConfig.forgotPassword, {
      "email": email,
    });
  }

  static Future<Map<String, dynamic>> verifyOtp(String email, String otp) {
    return ApiClient.post(ApiConfig.baseUrl + ApiConfig.verifyOtp, {
      "email": email,
      "otp": otp,
    });
  }

  static Future<Map<String, dynamic>> resetPassword(
    String token,
    String newPassword,
  ) {
    return ApiClient.post(ApiConfig.baseUrl + ApiConfig.resetPassword, {
      "password": newPassword,
    }, token: token);
  }
}
