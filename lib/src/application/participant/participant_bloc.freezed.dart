// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'participant_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ParticipantEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParticipantEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ParticipantEvent()';
}


}

/// @nodoc
class $ParticipantEventCopyWith<$Res>  {
$ParticipantEventCopyWith(ParticipantEvent _, $Res Function(ParticipantEvent) __);
}


/// @nodoc


class _Started implements ParticipantEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ParticipantEvent.started()';
}


}




/// @nodoc


class GetParticipant implements ParticipantEvent {
  const GetParticipant({required this.identifiant});
  

 final  String identifiant;

/// Create a copy of ParticipantEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetParticipantCopyWith<GetParticipant> get copyWith => _$GetParticipantCopyWithImpl<GetParticipant>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetParticipant&&(identical(other.identifiant, identifiant) || other.identifiant == identifiant));
}


@override
int get hashCode => Object.hash(runtimeType,identifiant);

@override
String toString() {
  return 'ParticipantEvent.getParticipant(identifiant: $identifiant)';
}


}

/// @nodoc
abstract mixin class $GetParticipantCopyWith<$Res> implements $ParticipantEventCopyWith<$Res> {
  factory $GetParticipantCopyWith(GetParticipant value, $Res Function(GetParticipant) _then) = _$GetParticipantCopyWithImpl;
@useResult
$Res call({
 String identifiant
});




}
/// @nodoc
class _$GetParticipantCopyWithImpl<$Res>
    implements $GetParticipantCopyWith<$Res> {
  _$GetParticipantCopyWithImpl(this._self, this._then);

  final GetParticipant _self;
  final $Res Function(GetParticipant) _then;

/// Create a copy of ParticipantEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? identifiant = null,}) {
  return _then(GetParticipant(
identifiant: null == identifiant ? _self.identifiant : identifiant // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class GetAllParticipants implements ParticipantEvent {
  const GetAllParticipants();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllParticipants);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ParticipantEvent.getAllParticipants()';
}


}




/// @nodoc


class GetAllParticipantsByVicariat implements ParticipantEvent {
  const GetAllParticipantsByVicariat({required this.vicariatCode});
  

 final  String vicariatCode;

/// Create a copy of ParticipantEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetAllParticipantsByVicariatCopyWith<GetAllParticipantsByVicariat> get copyWith => _$GetAllParticipantsByVicariatCopyWithImpl<GetAllParticipantsByVicariat>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllParticipantsByVicariat&&(identical(other.vicariatCode, vicariatCode) || other.vicariatCode == vicariatCode));
}


@override
int get hashCode => Object.hash(runtimeType,vicariatCode);

@override
String toString() {
  return 'ParticipantEvent.getAllParticipantsByVicariat(vicariatCode: $vicariatCode)';
}


}

/// @nodoc
abstract mixin class $GetAllParticipantsByVicariatCopyWith<$Res> implements $ParticipantEventCopyWith<$Res> {
  factory $GetAllParticipantsByVicariatCopyWith(GetAllParticipantsByVicariat value, $Res Function(GetAllParticipantsByVicariat) _then) = _$GetAllParticipantsByVicariatCopyWithImpl;
@useResult
$Res call({
 String vicariatCode
});




}
/// @nodoc
class _$GetAllParticipantsByVicariatCopyWithImpl<$Res>
    implements $GetAllParticipantsByVicariatCopyWith<$Res> {
  _$GetAllParticipantsByVicariatCopyWithImpl(this._self, this._then);

  final GetAllParticipantsByVicariat _self;
  final $Res Function(GetAllParticipantsByVicariat) _then;

/// Create a copy of ParticipantEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vicariatCode = null,}) {
  return _then(GetAllParticipantsByVicariat(
vicariatCode: null == vicariatCode ? _self.vicariatCode : vicariatCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SaveParticipant implements ParticipantEvent {
  const SaveParticipant({required this.participant});
  

 final  Participant participant;

/// Create a copy of ParticipantEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaveParticipantCopyWith<SaveParticipant> get copyWith => _$SaveParticipantCopyWithImpl<SaveParticipant>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaveParticipant&&(identical(other.participant, participant) || other.participant == participant));
}


@override
int get hashCode => Object.hash(runtimeType,participant);

@override
String toString() {
  return 'ParticipantEvent.saveParticipant(participant: $participant)';
}


}

/// @nodoc
abstract mixin class $SaveParticipantCopyWith<$Res> implements $ParticipantEventCopyWith<$Res> {
  factory $SaveParticipantCopyWith(SaveParticipant value, $Res Function(SaveParticipant) _then) = _$SaveParticipantCopyWithImpl;
@useResult
$Res call({
 Participant participant
});




}
/// @nodoc
class _$SaveParticipantCopyWithImpl<$Res>
    implements $SaveParticipantCopyWith<$Res> {
  _$SaveParticipantCopyWithImpl(this._self, this._then);

  final SaveParticipant _self;
  final $Res Function(SaveParticipant) _then;

/// Create a copy of ParticipantEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? participant = null,}) {
  return _then(SaveParticipant(
participant: null == participant ? _self.participant : participant // ignore: cast_nullable_to_non_nullable
as Participant,
  ));
}


}

/// @nodoc


class UpdateParticipant implements ParticipantEvent {
  const UpdateParticipant({required this.participant});
  

 final  Participant participant;

/// Create a copy of ParticipantEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateParticipantCopyWith<UpdateParticipant> get copyWith => _$UpdateParticipantCopyWithImpl<UpdateParticipant>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateParticipant&&(identical(other.participant, participant) || other.participant == participant));
}


@override
int get hashCode => Object.hash(runtimeType,participant);

@override
String toString() {
  return 'ParticipantEvent.updateParticipant(participant: $participant)';
}


}

/// @nodoc
abstract mixin class $UpdateParticipantCopyWith<$Res> implements $ParticipantEventCopyWith<$Res> {
  factory $UpdateParticipantCopyWith(UpdateParticipant value, $Res Function(UpdateParticipant) _then) = _$UpdateParticipantCopyWithImpl;
@useResult
$Res call({
 Participant participant
});




}
/// @nodoc
class _$UpdateParticipantCopyWithImpl<$Res>
    implements $UpdateParticipantCopyWith<$Res> {
  _$UpdateParticipantCopyWithImpl(this._self, this._then);

  final UpdateParticipant _self;
  final $Res Function(UpdateParticipant) _then;

/// Create a copy of ParticipantEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? participant = null,}) {
  return _then(UpdateParticipant(
participant: null == participant ? _self.participant : participant // ignore: cast_nullable_to_non_nullable
as Participant,
  ));
}


}

/// @nodoc


class DeleteParticipant implements ParticipantEvent {
  const DeleteParticipant({required this.participant});
  

 final  Participant participant;

/// Create a copy of ParticipantEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteParticipantCopyWith<DeleteParticipant> get copyWith => _$DeleteParticipantCopyWithImpl<DeleteParticipant>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteParticipant&&(identical(other.participant, participant) || other.participant == participant));
}


@override
int get hashCode => Object.hash(runtimeType,participant);

@override
String toString() {
  return 'ParticipantEvent.deleteParticipant(participant: $participant)';
}


}

/// @nodoc
abstract mixin class $DeleteParticipantCopyWith<$Res> implements $ParticipantEventCopyWith<$Res> {
  factory $DeleteParticipantCopyWith(DeleteParticipant value, $Res Function(DeleteParticipant) _then) = _$DeleteParticipantCopyWithImpl;
@useResult
$Res call({
 Participant participant
});




}
/// @nodoc
class _$DeleteParticipantCopyWithImpl<$Res>
    implements $DeleteParticipantCopyWith<$Res> {
  _$DeleteParticipantCopyWithImpl(this._self, this._then);

  final DeleteParticipant _self;
  final $Res Function(DeleteParticipant) _then;

/// Create a copy of ParticipantEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? participant = null,}) {
  return _then(DeleteParticipant(
participant: null == participant ? _self.participant : participant // ignore: cast_nullable_to_non_nullable
as Participant,
  ));
}


}

/// @nodoc


class DeleteAllParticipants implements ParticipantEvent {
  const DeleteAllParticipants();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteAllParticipants);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ParticipantEvent.deleteAllParticipants()';
}


}




/// @nodoc


class LoadVicariats implements ParticipantEvent {
  const LoadVicariats();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadVicariats);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ParticipantEvent.loadVicariats()';
}


}




/// @nodoc
mixin _$ParticipantState {

 List<Participant>? get participants; List<Participant>? get vicariatParticipants; bool get showErrorMessages; bool get isLoading; bool get isSubmitable; Participant? get currentParticipant; String? get verificationId; ParticipantAction? get action; List<Vicariat>? get vicariats; Option<Either<GlobalFailure, Unit>> get failureOrSuccessOption;
/// Create a copy of ParticipantState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParticipantStateCopyWith<ParticipantState> get copyWith => _$ParticipantStateCopyWithImpl<ParticipantState>(this as ParticipantState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParticipantState&&const DeepCollectionEquality().equals(other.participants, participants)&&const DeepCollectionEquality().equals(other.vicariatParticipants, vicariatParticipants)&&(identical(other.showErrorMessages, showErrorMessages) || other.showErrorMessages == showErrorMessages)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSubmitable, isSubmitable) || other.isSubmitable == isSubmitable)&&(identical(other.currentParticipant, currentParticipant) || other.currentParticipant == currentParticipant)&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.action, action) || other.action == action)&&const DeepCollectionEquality().equals(other.vicariats, vicariats)&&(identical(other.failureOrSuccessOption, failureOrSuccessOption) || other.failureOrSuccessOption == failureOrSuccessOption));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(participants),const DeepCollectionEquality().hash(vicariatParticipants),showErrorMessages,isLoading,isSubmitable,currentParticipant,verificationId,action,const DeepCollectionEquality().hash(vicariats),failureOrSuccessOption);

@override
String toString() {
  return 'ParticipantState(participants: $participants, vicariatParticipants: $vicariatParticipants, showErrorMessages: $showErrorMessages, isLoading: $isLoading, isSubmitable: $isSubmitable, currentParticipant: $currentParticipant, verificationId: $verificationId, action: $action, vicariats: $vicariats, failureOrSuccessOption: $failureOrSuccessOption)';
}


}

/// @nodoc
abstract mixin class $ParticipantStateCopyWith<$Res>  {
  factory $ParticipantStateCopyWith(ParticipantState value, $Res Function(ParticipantState) _then) = _$ParticipantStateCopyWithImpl;
@useResult
$Res call({
 List<Participant>? participants, List<Participant>? vicariatParticipants, bool showErrorMessages, bool isLoading, bool isSubmitable, Participant? currentParticipant, String? verificationId, ParticipantAction? action, List<Vicariat>? vicariats, Option<Either<GlobalFailure, Unit>> failureOrSuccessOption
});




}
/// @nodoc
class _$ParticipantStateCopyWithImpl<$Res>
    implements $ParticipantStateCopyWith<$Res> {
  _$ParticipantStateCopyWithImpl(this._self, this._then);

  final ParticipantState _self;
  final $Res Function(ParticipantState) _then;

/// Create a copy of ParticipantState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? participants = freezed,Object? vicariatParticipants = freezed,Object? showErrorMessages = null,Object? isLoading = null,Object? isSubmitable = null,Object? currentParticipant = freezed,Object? verificationId = freezed,Object? action = freezed,Object? vicariats = freezed,Object? failureOrSuccessOption = null,}) {
  return _then(_self.copyWith(
participants: freezed == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as List<Participant>?,vicariatParticipants: freezed == vicariatParticipants ? _self.vicariatParticipants : vicariatParticipants // ignore: cast_nullable_to_non_nullable
as List<Participant>?,showErrorMessages: null == showErrorMessages ? _self.showErrorMessages : showErrorMessages // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSubmitable: null == isSubmitable ? _self.isSubmitable : isSubmitable // ignore: cast_nullable_to_non_nullable
as bool,currentParticipant: freezed == currentParticipant ? _self.currentParticipant : currentParticipant // ignore: cast_nullable_to_non_nullable
as Participant?,verificationId: freezed == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String?,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as ParticipantAction?,vicariats: freezed == vicariats ? _self.vicariats : vicariats // ignore: cast_nullable_to_non_nullable
as List<Vicariat>?,failureOrSuccessOption: null == failureOrSuccessOption ? _self.failureOrSuccessOption : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, Unit>>,
  ));
}

}


/// @nodoc


class _ParticipantState implements ParticipantState {
  const _ParticipantState({required final  List<Participant>? participants, required final  List<Participant>? vicariatParticipants, required this.showErrorMessages, required this.isLoading, required this.isSubmitable, this.currentParticipant, required this.verificationId, this.action, final  List<Vicariat>? vicariats, required this.failureOrSuccessOption}): _participants = participants,_vicariatParticipants = vicariatParticipants,_vicariats = vicariats;
  

 final  List<Participant>? _participants;
@override List<Participant>? get participants {
  final value = _participants;
  if (value == null) return null;
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Participant>? _vicariatParticipants;
@override List<Participant>? get vicariatParticipants {
  final value = _vicariatParticipants;
  if (value == null) return null;
  if (_vicariatParticipants is EqualUnmodifiableListView) return _vicariatParticipants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool showErrorMessages;
@override final  bool isLoading;
@override final  bool isSubmitable;
@override final  Participant? currentParticipant;
@override final  String? verificationId;
@override final  ParticipantAction? action;
 final  List<Vicariat>? _vicariats;
@override List<Vicariat>? get vicariats {
  final value = _vicariats;
  if (value == null) return null;
  if (_vicariats is EqualUnmodifiableListView) return _vicariats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  Option<Either<GlobalFailure, Unit>> failureOrSuccessOption;

/// Create a copy of ParticipantState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParticipantStateCopyWith<_ParticipantState> get copyWith => __$ParticipantStateCopyWithImpl<_ParticipantState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParticipantState&&const DeepCollectionEquality().equals(other._participants, _participants)&&const DeepCollectionEquality().equals(other._vicariatParticipants, _vicariatParticipants)&&(identical(other.showErrorMessages, showErrorMessages) || other.showErrorMessages == showErrorMessages)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSubmitable, isSubmitable) || other.isSubmitable == isSubmitable)&&(identical(other.currentParticipant, currentParticipant) || other.currentParticipant == currentParticipant)&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.action, action) || other.action == action)&&const DeepCollectionEquality().equals(other._vicariats, _vicariats)&&(identical(other.failureOrSuccessOption, failureOrSuccessOption) || other.failureOrSuccessOption == failureOrSuccessOption));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_participants),const DeepCollectionEquality().hash(_vicariatParticipants),showErrorMessages,isLoading,isSubmitable,currentParticipant,verificationId,action,const DeepCollectionEquality().hash(_vicariats),failureOrSuccessOption);

@override
String toString() {
  return 'ParticipantState(participants: $participants, vicariatParticipants: $vicariatParticipants, showErrorMessages: $showErrorMessages, isLoading: $isLoading, isSubmitable: $isSubmitable, currentParticipant: $currentParticipant, verificationId: $verificationId, action: $action, vicariats: $vicariats, failureOrSuccessOption: $failureOrSuccessOption)';
}


}

/// @nodoc
abstract mixin class _$ParticipantStateCopyWith<$Res> implements $ParticipantStateCopyWith<$Res> {
  factory _$ParticipantStateCopyWith(_ParticipantState value, $Res Function(_ParticipantState) _then) = __$ParticipantStateCopyWithImpl;
@override @useResult
$Res call({
 List<Participant>? participants, List<Participant>? vicariatParticipants, bool showErrorMessages, bool isLoading, bool isSubmitable, Participant? currentParticipant, String? verificationId, ParticipantAction? action, List<Vicariat>? vicariats, Option<Either<GlobalFailure, Unit>> failureOrSuccessOption
});




}
/// @nodoc
class __$ParticipantStateCopyWithImpl<$Res>
    implements _$ParticipantStateCopyWith<$Res> {
  __$ParticipantStateCopyWithImpl(this._self, this._then);

  final _ParticipantState _self;
  final $Res Function(_ParticipantState) _then;

/// Create a copy of ParticipantState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? participants = freezed,Object? vicariatParticipants = freezed,Object? showErrorMessages = null,Object? isLoading = null,Object? isSubmitable = null,Object? currentParticipant = freezed,Object? verificationId = freezed,Object? action = freezed,Object? vicariats = freezed,Object? failureOrSuccessOption = null,}) {
  return _then(_ParticipantState(
participants: freezed == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<Participant>?,vicariatParticipants: freezed == vicariatParticipants ? _self._vicariatParticipants : vicariatParticipants // ignore: cast_nullable_to_non_nullable
as List<Participant>?,showErrorMessages: null == showErrorMessages ? _self.showErrorMessages : showErrorMessages // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSubmitable: null == isSubmitable ? _self.isSubmitable : isSubmitable // ignore: cast_nullable_to_non_nullable
as bool,currentParticipant: freezed == currentParticipant ? _self.currentParticipant : currentParticipant // ignore: cast_nullable_to_non_nullable
as Participant?,verificationId: freezed == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String?,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as ParticipantAction?,vicariats: freezed == vicariats ? _self._vicariats : vicariats // ignore: cast_nullable_to_non_nullable
as List<Vicariat>?,failureOrSuccessOption: null == failureOrSuccessOption ? _self.failureOrSuccessOption : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, Unit>>,
  ));
}


}

// dart format on
