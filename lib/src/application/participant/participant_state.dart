part of 'participant_bloc.dart';

enum ParticipantAction { add, update, delete, get }

@freezed
abstract class ParticipantState with _$ParticipantState {
  const factory ParticipantState({
    required List<Participant>? participants,
    required List<Participant>? vicariatParticipants,
    required bool showErrorMessages,
    required bool isLoading,
    required bool isSubmitable,
    Participant? currentParticipant,
    required String? verificationId,
    ParticipantAction? action,
    required Option<Either<GlobalFailure, Unit>> failureOrSuccessOption,
  }) = _ParticipantState;

  factory ParticipantState.initial() => ParticipantState(
    verificationId: null,
    showErrorMessages: false,
    isLoading: false,
    isSubmitable: false,
    currentParticipant: null,
    failureOrSuccessOption: none(),
    participants: null,
    vicariatParticipants: null,
  );
}
