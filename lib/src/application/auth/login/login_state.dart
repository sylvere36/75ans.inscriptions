part of 'login_bloc.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    required bool showErrorMessages,
    required bool isSubmitting,
    required bool isSubmitable,
    required String clickType,
    required bool? restartApp,
    List<Vicariat>? vicariats,
    String? errorMessage,
    bool? isLoggedIn,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _LoginState;

  factory LoginState.initial() => LoginState(
    showErrorMessages: false,
    isSubmitting: false,
    isSubmitable: false,
    restartApp: null,
    clickType: '',
    authFailureOrSuccessOption: none(),
  );
}
