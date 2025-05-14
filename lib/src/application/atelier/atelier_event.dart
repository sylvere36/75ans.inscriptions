part of 'atelier_bloc.dart';

@freezed
class AtelierEvent with _$AtelierEvent {
  const factory AtelierEvent.started() = _Started;
  const factory AtelierEvent.getAtelier({required String identifiant}) =
      GetAtelier;
  const factory AtelierEvent.getAllAteliers() = GetAllAteliers;
  const factory AtelierEvent.getAllAteliersByVicariat({
    required String vicariatCode,
  }) = GetAllAteliersByVicariat;
  const factory AtelierEvent.saveAtelier({required Atelier atelier}) =
      SaveAtelier;
  const factory AtelierEvent.updateAtelier({required Atelier atelier}) =
      UpdateAtelier;
  const factory AtelierEvent.deleteAtelier({required Atelier atelier}) =
      DeleteAtelier;
  const factory AtelierEvent.deleteAllAteliers() = DeleteAllAteliers;
}
