import 'i_auth_service.dart';
import 'mock_auth_service.dart';

class AuthService {
  //static final IAuthService _authService = FirebaseAuthService();
  static final IAuthService _authService = MockAuthService();

  static IAuthService get authService => _authService;
}
