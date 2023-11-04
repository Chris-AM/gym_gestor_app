import 'package:dio/dio.dart';
import '/domain/domain.dart';
import '/features/auth/domain/domain.dart';

class AuthDataSourceImpl extends AuthDataSource {
  final dio = Dio();
  @override
  Future<UserEntity> checkAuth(String token) {
    // TODO: implement checkAuth
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> register(String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
  
}