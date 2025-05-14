part of 'achat_pagne_bloc.dart';

enum AchatPagneAction { add, update, delete, get }

@freezed
abstract class AchatPagneState with _$AchatPagneState {
  const factory AchatPagneState({
    required List<AchatPagne>? achatPagnes,
    required List<AchatPagne>? vicariatAchatPagnes,
    required bool showErrorMessages,
    required bool isLoading,
    required bool isSubmitable,
    AchatPagne? currentAchatPagne,
    required String? verificationId,
    AchatPagneAction? action,
    required Option<Either<GlobalFailure, Unit>> failureOrSuccessOption,
  }) = _AchatPagneState;

  factory AchatPagneState.initial() => AchatPagneState(
    verificationId: null,
    showErrorMessages: false,
    isLoading: false,
    isSubmitable: false,
    currentAchatPagne: null,
    failureOrSuccessOption: none(),
    achatPagnes: null,
    vicariatAchatPagnes: null,
  );
}
