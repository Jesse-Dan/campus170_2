import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../utils/enums/enums.dart';
import '../exception/client_exception.dart';
import '../interfaces/client_interface.dart';
import '../services/logger/logger.dart';
import 'client_options/client_options.dart';

class ApiClient with ClientInterface, ClientUtils {

  Future<(Map<String, dynamic>?, ResponseType)> handleResponse(
      http.Response response) async {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return (
        json.decode(response.body) as Map<String, dynamic>,
        ResponseType.Success
      );
    }
   else {
      return (
        json.decode(response.body) as Map<String, dynamic>,
        ResponseType.Error
      );
    }
  }

  Future<(Map<String, dynamic>?, ResponseType)> sendRequest({
    required String endpoint,
    HttpMethod method = HttpMethod.get,
    Map<String, dynamic>? queryParams,
    bool isAuth = false,
    dynamic body,
  }) async {
    try {
      final response = await makeRequest(
              '${ClientUtils.getOptions(
                isAuth: isAuth,
              ).baseUrl!}'
              '$endpoint',
              method: method,
              queryParams: queryParams,
              headers: ClientUtils.getOptions(
                isAuth: isAuth,
              ).headers,
              body: json.encode(body))
          .timeout(const Duration(seconds: 50000), onTimeout: () {
        throw TimeoutException('Request timed out after 50000 seconds');
      });
      return await handleResponse(response);
    } on TimeoutException catch (error, s) {
      Logger.log(
          message: 'Error: ${error.message}',
          tag: Tag.ERROR,
          error: error,
          stackTrace: s);
      return (null, ResponseType.TIME_OUT);
    } on ClientException catch (error, s) {
      Logger.log(
          message: 'Error: ${error.message}',
          tag: Tag.ERROR,
          error: error,
          stackTrace: s);
      return (null, ResponseType.CLIENT_ERROR);
    } catch (error, s) {
      Logger.log(
          message: 'Error: ${error.toString()}',
          tag: Tag.ERROR,
          error: error,
          stackTrace: s);
      return (null, ResponseType.UNKNOWN_ERROR);
    }
  }
}
