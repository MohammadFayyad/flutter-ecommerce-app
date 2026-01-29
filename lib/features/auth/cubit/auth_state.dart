abstract class AuthState {}

class InitialAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class SuccessAuthState extends AuthState {
  final String message;
  SuccessAuthState({required this.message});
}

class ErrorAuthState extends AuthState {
  final String message;
  ErrorAuthState({required this.message});
}
