import '/domain/domain.dart';

abstract class AuthDataSource {
  Future<UserEntity> login(String email, String password);
  Future<UserEntity> register(String email, String password);
  Future<UserEntity> checkAuth(String token);
}
