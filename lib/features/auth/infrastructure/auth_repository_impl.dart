import '/domain/domain.dart';
import '/features/auth/domain/domain.dart';

import 'infrastructure.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource _dataSource;

  AuthRepositoryImpl({ AuthDataSource? dataSource})
      : _dataSource = dataSource ?? AuthDummyDataSourceImpl();

  @override
  Future<UserEntity> checkAuth(String token) {
    return _dataSource.checkAuth(token);
  }

  @override
  Future<UserEntity> login(String email, String password) {
    return _dataSource.login(email, password);
  }

  @override
  Future<UserEntity> register(String email, String password) {
    return _dataSource.register(email, password);
  }
}
