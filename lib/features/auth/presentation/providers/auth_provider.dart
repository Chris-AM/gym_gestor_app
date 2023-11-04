import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_gestor_app/domain/domain.dart';
import 'package:gym_gestor_app/features/auth/domain/domain.dart';
import 'package:gym_gestor_app/features/auth/infrastructure/infrastructure.dart';
import 'package:gym_gestor_app/infrastructure/infrastructure.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImpl();
  final keyValueStorageService = KeyValueStorageServiceImpl();

  return AuthNotifier(
    authRepository: authRepository,
    keyValueStorageService: keyValueStorageService,
  );
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;
  final KeyValueStorageService keyValueStorageService;

  AuthNotifier({
    required this.authRepository,
    required this.keyValueStorageService,
  }) : super(AuthState()) {
    checkAuthStatus();
  }

  Future<void> loginUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 200));
    try {
      final user = await authRepository.login(email, password);
      _setLoggedUser(user);
    } catch (e) {
      logout(e.toString());
    }
  }

  Future<void> registerUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 200));
    try {
      final user = await authRepository.register(email, password);
      _setLoggedUser(user);
    } catch (e) {
      logout(e.toString());
    }
  }

  void checkAuthStatus() async {
    final token = await keyValueStorageService.getValue<String>('token');
    if (token == null) return logout();
    try {
      final user = await authRepository.checkAuth(token);
      _setLoggedUser(user);
    } catch (e) {
      logout(e.toString());
    }
  }

  Future<void> logout([String? errorMessage]) async {
    await keyValueStorageService.removeValue('token');
    state = state.copyWith(
      authStatus: AuthStatus.unauthenticated,
      user: null,
      errorMessage: errorMessage,
    );
  }

  void _setLoggedUser(UserEntity user) async {
    await keyValueStorageService.setKeyValue('token', user.token);
    state = state.copyWith(
      authStatus: AuthStatus.authenticated,
      user: user,
      errorMessage: '',
    );
  }
}

enum AuthStatus {
  checking,
  authenticated,
  unauthenticated,
}

class AuthState {
  final AuthStatus authStatus;
  final String errorMessage;
  final UserEntity? user;

  AuthState({
    this.authStatus = AuthStatus.checking,
    this.errorMessage = '',
    this.user,
  });

  AuthState copyWith({
    AuthStatus? authStatus,
    String? errorMessage,
    UserEntity? user,
  }) =>
      AuthState(
        authStatus: authStatus ?? this.authStatus,
        errorMessage: errorMessage ?? this.errorMessage,
        user: user ?? this.user,
      );
}
