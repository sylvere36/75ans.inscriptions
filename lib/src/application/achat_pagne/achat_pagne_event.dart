part of 'achat_pagne_bloc.dart';

@freezed
class AchatPagneEvent with _$AchatPagneEvent {
  const factory AchatPagneEvent.started() = _Started;
  const factory AchatPagneEvent.getAchatPagne({required String identifiant}) =
      GetAchatPagne;
  const factory AchatPagneEvent.getAllAchatPagnes() = GetAllAchatPagnes;
  const factory AchatPagneEvent.getAllAchatPagnesByVicariat({
    required String vicariatCode,
  }) = GetAllAchatPagnesByVicariat;
  const factory AchatPagneEvent.saveAchatPagne({
    required AchatPagne achatPagne,
  }) = SaveAchatPagne;
  const factory AchatPagneEvent.updateAchatPagne({
    required AchatPagne achatPagne,
  }) = UpdateAchatPagne;
  const factory AchatPagneEvent.deleteAchatPagne({
    required AchatPagne achatPagne,
  }) = DeleteAchatPagne;
  const factory AchatPagneEvent.deleteAllAchatPagnes() = DeleteAllAchatPagnes;
}
