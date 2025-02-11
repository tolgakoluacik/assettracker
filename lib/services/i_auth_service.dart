import 'package:asset_tracker/models/user.dart';

abstract class IAuthService {
  Future<UserModel?> signInWithEmailAndPassword(String email, String password);
  Future<UserModel?> registerWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  UserModel? getCurrentUser();
}