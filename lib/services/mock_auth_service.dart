import '../models/user.dart';
import 'i_auth_service.dart';

class MockAuthService implements IAuthService {
  UserModel? _mockUser;

  @override
  Future<UserModel?> signInWithEmailAndPassword(String email, String password) async {
    if (email != 'tolga@email.com') {
      throw AuthException('user-not-found');
    }

    if (password != '123456') {
      throw AuthException('wrong-password');
    }

    if (email == "tolga@email.com" && password == "123456") {
      _mockUser = UserModel(id: "1", email: email);
      return _mockUser;
    }
  }

  @override
  Future<UserModel?> registerWithEmailAndPassword(String email, String password) async {
    _mockUser = UserModel(id: "2", email: email);
    return _mockUser;
  }

  @override
  Future<void> signOut() async {
    _mockUser = null;
  }

  @override
  UserModel? getCurrentUser() {
    return _mockUser;
  }
}

class AuthException implements Exception {
  final String code;
  AuthException(this.code);
}
