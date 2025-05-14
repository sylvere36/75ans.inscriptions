part of 'atelier_bloc.dart';

enum AtelierAction { add, update, delete, get }

@freezed
abstract class AtelierState with _$AtelierState {
  const factory AtelierState({
    required List<Atelier>? ateliers,
    required List<Atelier>? vicariatAteliers,
    required bool showErrorMessages,
    required bool isLoading,
    required bool isSubmitable,
    Atelier? currentAtelier,
    required String? verificationId,
    AtelierAction? action,
    required Option<Either<GlobalFailure, Unit>> failureOrSuccessOption,
  }) = _AtelierState;

  factory AtelierState.initial() => AtelierState(
    verificationId: null,
    showErrorMessages: false,
    isLoading: false,
    isSubmitable: false,
    currentAtelier: null,
    failureOrSuccessOption: none(),
    ateliers: null,
    vicariatAteliers: null,
  );
}
