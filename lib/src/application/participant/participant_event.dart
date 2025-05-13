part of 'participant_bloc.dart';

@freezed
class ParticipantEvent with _$ParticipantEvent {
  const factory ParticipantEvent.started() = _Started;
  const factory ParticipantEvent.getParticipant({required String identifiant}) =
      GetParticipant;
  const factory ParticipantEvent.getAllParticipants() = GetAllParticipants;
  const factory ParticipantEvent.getAllParticipantsByVicariat({
    required String vicariatCode,
  }) = GetAllParticipantsByVicariat;
  const factory ParticipantEvent.saveParticipant({
    required Participant participant,
  }) = SaveParticipant;
  const factory ParticipantEvent.updateParticipant({
    required Participant participant,
  }) = UpdateParticipant;
  const factory ParticipantEvent.deleteParticipant({
    required Participant participant,
  }) = DeleteParticipant;
  const factory ParticipantEvent.deleteAllParticipants() =
      DeleteAllParticipants;
}
