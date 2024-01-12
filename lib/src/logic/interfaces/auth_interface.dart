import '../../utils/enums/enums.dart';

mixin AuthInterface {
  Future<(Map<String, dynamic>?, ResponseType)> login();
  Future<(Map<String, dynamic>?, ResponseType)> register();
}
