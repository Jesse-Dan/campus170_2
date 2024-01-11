// ignore_for_file: constant_identifier_names

class GlobalConstants {
  static const k20 = 20.0;
  static const k16 = 16.0;
  static const k12 = 12.0;
  static const k14 = 14.0;
  static const k0 = 0.0;

  /// STORAGE KEYS
  static const String BEARER_TOKEN = 'BEARER-TOKEN';

  /// ENDPOINTS
  static const String BASE_URL = 'http://192.168.0.3:8000/api/v1/';
  static const String POSTS_ENDPOINT = 'app/posts';

  /// MAIN PREFIXES
  static const String AUTH_MIDPOINT = 'auth';
  static const String APP_MIDPOINT = 'app';

  /// PREFIX
  static const String POST_MIDPOINT = 'post';
  static const String USER_MIDPOINT = 'user';
  static const String SUSCRIBE_MIDPOINT = 'sub';
}

/// PAYSTACK KEYS
class PaystackConstant {
  static const String SK_LIVE =
      'sk_live_144c8f633c619c8eaaaf8939756e4df904dbb2b8';
  static const String SK_TEST =
      'sk_test_e012d9b453fe4b6b5bf2e7b67cb7f3fb7ab78345';
}
