part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.started() = _Started;
  const factory LoginEvent.loadVicariats() = LoadVicariats;
  const factory LoginEvent.submit({
    required Vicariat vicariat,
    required String code,
  }) = Submit;
}
