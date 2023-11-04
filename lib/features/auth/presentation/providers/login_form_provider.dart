import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:gym_gestor_app/features/auth/presentation/providers/auth_provider.dart';

import '/infrastructure/inputs/inputs.dart';

final loginFormProvider =
    StateNotifierProvider.autoDispose<LoginFormNotifier, LoginFormState>((ref) {
  final loginUserCallBack = ref.watch(authProvider.notifier).loginUser;
  return LoginFormNotifier(loginCallBack: loginUserCallBack);
});

class LoginFormNotifier extends StateNotifier<LoginFormState> {
  final Function(String, String) loginCallBack;

  LoginFormNotifier({
    required this.loginCallBack,
  }) : super(LoginFormState());

  onEmailChanged(String email) {
    final emailInput = Email.dirty(email);
    state = state.copyWith(
      email: emailInput,
      isFormValid: Formz.validate(
        [
          emailInput,
          state.password,
        ],
      ),
    );
  }

  onPasswordChanged(String password) {
    final passwordInput = Password.dirty(password);
    state = state.copyWith(
      password: passwordInput,
      isFormValid: Formz.validate(
        [
          state.email,
          passwordInput,
        ],
      ),
    );
  }

  onFormSubmit() async {
    _touchEveryField();
    if (!state.isFormValid) return;
    state = state.copyWith(isPosting: true);
    await loginCallBack(state.email.value, state.password.value);
    state = state.copyWith(isPosting: false);
  }

  _touchEveryField() {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);

    state = state.copyWith(
      isFormPosted: true,
      email: email,
      password: password,
      isFormValid: Formz.validate([
        email,
        password,
      ]),
    );
  }
}

class LoginFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isFormValid;
  final Email email;
  final Password password;

  LoginFormState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isFormValid = false,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
  });

  LoginFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isFormValid,
    Email? email,
    Password? password,
  }) {
    return LoginFormState(
      isPosting: isPosting ?? this.isPosting,
      isFormPosted: isFormPosted ?? this.isFormPosted,
      isFormValid: isFormValid ?? this.isFormValid,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  String toString() {
    return '''LoginFormState {
      isPosting: $isPosting,
      isFormPosted: $isFormPosted,
      isFormValid: $isFormValid,
      email: $email,
      password: $password,


      }''';
  }
}
