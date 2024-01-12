import '../../../utils/enums/enums.dart';
import '../../core/client.dart';
import '../../interfaces/auth_interface.dart';

class AuthRepository implements AuthInterface {
  ApiClient appClient = ApiClient();
  
  @override
  Future<(Map<String, dynamic>?, ResponseType)> login() {
    // TODO: implement login
    throw UnimplementedError();
  }
  
  @override
  Future<(Map<String, dynamic>?, ResponseType)> register() {
    // TODO: implement register
    throw UnimplementedError();
  }
}
