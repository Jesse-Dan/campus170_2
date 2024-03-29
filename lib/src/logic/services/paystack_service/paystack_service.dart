import '../../../utils/enums/enums.dart';
import '../../core/client.dart';

class PaystackService {
  static final PaystackService _instance = PaystackService._internal();

  factory PaystackService() {
    return _instance;
  }

  PaystackService._internal();

  final ApiClient _apiClient = ApiClient();

  Future<Map<String, dynamic>> _post(String url, dynamic data) async {
    try {
      final response = await _apiClient.sendRequest(
        endpoint: url,
        method: HttpMethod.post,
        isPaystackAuth: true,
        body: data,
      );

      if (response.$2 == ResponseType.Success) {
        return response.$1!;
      } else {
        throw Exception(response.toString());
      }
    } catch (error) {
      throw Exception('Failed to perform Paystack operation: $error');
    }
  }

  Future<Map<String, dynamic>> addCustomer(
      String email, String name, String phone) async {
    const url = 'https://api.paystack.co/customer';
    final data = {
      'email': email,
      'first_name': name,
      'phone': phone,
      'last_name': "Test last name"
    };

    return await _post(url, data);
  }

  Future<Map<String, dynamic>> initializeTransaction(
      double amount, String email) async {
    const url = 'https://api.paystack.co/transaction/initialize';
    final data = {
      'email': email,
      'amount': amount * 100,
    };

    return await _post(url, data);
  }

  Future<Map<String, dynamic>> verifyTransaction(String reference) async {
    final url = 'https://api.paystack.co/transaction/verify/$reference';

    try {
      final response = await _apiClient.sendRequest(
        endpoint: url,
        method: HttpMethod.get,
        isPaystackAuth: true,
      );

      if (response.$2 == ResponseType.Success) {
        return response.$1!;
      } else {
        throw Exception('Failed to verify Paystack transaction');
      }
    } catch (error) {
      throw Exception('Failed to verify Paystack transaction: $error');
    }
  }
}
