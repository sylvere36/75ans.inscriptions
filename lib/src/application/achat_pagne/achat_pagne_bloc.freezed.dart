// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achat_pagne_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AchatPagneEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AchatPagneEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AchatPagneEvent()';
}


}

/// @nodoc
class $AchatPagneEventCopyWith<$Res>  {
$AchatPagneEventCopyWith(AchatPagneEvent _, $Res Function(AchatPagneEvent) __);
}


/// @nodoc


class _Started implements AchatPagneEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AchatPagneEvent.started()';
}


}




/// @nodoc


class GetAchatPagne implements AchatPagneEvent {
  const GetAchatPagne({required this.identifiant});
  

 final  String identifiant;

/// Create a copy of AchatPagneEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetAchatPagneCopyWith<GetAchatPagne> get copyWith => _$GetAchatPagneCopyWithImpl<GetAchatPagne>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAchatPagne&&(identical(other.identifiant, identifiant) || other.identifiant == identifiant));
}


@override
int get hashCode => Object.hash(runtimeType,identifiant);

@override
String toString() {
  return 'AchatPagneEvent.getAchatPagne(identifiant: $identifiant)';
}


}

/// @nodoc
abstract mixin class $GetAchatPagneCopyWith<$Res> implements $AchatPagneEventCopyWith<$Res> {
  factory $GetAchatPagneCopyWith(GetAchatPagne value, $Res Function(GetAchatPagne) _then) = _$GetAchatPagneCopyWithImpl;
@useResult
$Res call({
 String identifiant
});




}
/// @nodoc
class _$GetAchatPagneCopyWithImpl<$Res>
    implements $GetAchatPagneCopyWith<$Res> {
  _$GetAchatPagneCopyWithImpl(this._self, this._then);

  final GetAchatPagne _self;
  final $Res Function(GetAchatPagne) _then;

/// Create a copy of AchatPagneEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? identifiant = null,}) {
  return _then(GetAchatPagne(
identifiant: null == identifiant ? _self.identifiant : identifiant // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class GetAllAchatPagnes implements AchatPagneEvent {
  const GetAllAchatPagnes();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllAchatPagnes);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AchatPagneEvent.getAllAchatPagnes()';
}


}




/// @nodoc


class GetAllAchatPagnesByVicariat implements AchatPagneEvent {
  const GetAllAchatPagnesByVicariat({required this.vicariatCode});
  

 final  String vicariatCode;

/// Create a copy of AchatPagneEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetAllAchatPagnesByVicariatCopyWith<GetAllAchatPagnesByVicariat> get copyWith => _$GetAllAchatPagnesByVicariatCopyWithImpl<GetAllAchatPagnesByVicariat>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllAchatPagnesByVicariat&&(identical(other.vicariatCode, vicariatCode) || other.vicariatCode == vicariatCode));
}


@override
int get hashCode => Object.hash(runtimeType,vicariatCode);

@override
String toString() {
  return 'AchatPagneEvent.getAllAchatPagnesByVicariat(vicariatCode: $vicariatCode)';
}


}

/// @nodoc
abstract mixin class $GetAllAchatPagnesByVicariatCopyWith<$Res> implements $AchatPagneEventCopyWith<$Res> {
  factory $GetAllAchatPagnesByVicariatCopyWith(GetAllAchatPagnesByVicariat value, $Res Function(GetAllAchatPagnesByVicariat) _then) = _$GetAllAchatPagnesByVicariatCopyWithImpl;
@useResult
$Res call({
 String vicariatCode
});




}
/// @nodoc
class _$GetAllAchatPagnesByVicariatCopyWithImpl<$Res>
    implements $GetAllAchatPagnesByVicariatCopyWith<$Res> {
  _$GetAllAchatPagnesByVicariatCopyWithImpl(this._self, this._then);

  final GetAllAchatPagnesByVicariat _self;
  final $Res Function(GetAllAchatPagnesByVicariat) _then;

/// Create a copy of AchatPagneEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vicariatCode = null,}) {
  return _then(GetAllAchatPagnesByVicariat(
vicariatCode: null == vicariatCode ? _self.vicariatCode : vicariatCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SaveAchatPagne implements AchatPagneEvent {
  const SaveAchatPagne({required this.achatPagne});
  

 final  AchatPagne achatPagne;

/// Create a copy of AchatPagneEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaveAchatPagneCopyWith<SaveAchatPagne> get copyWith => _$SaveAchatPagneCopyWithImpl<SaveAchatPagne>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaveAchatPagne&&(identical(other.achatPagne, achatPagne) || other.achatPagne == achatPagne));
}


@override
int get hashCode => Object.hash(runtimeType,achatPagne);

@override
String toString() {
  return 'AchatPagneEvent.saveAchatPagne(achatPagne: $achatPagne)';
}


}

/// @nodoc
abstract mixin class $SaveAchatPagneCopyWith<$Res> implements $AchatPagneEventCopyWith<$Res> {
  factory $SaveAchatPagneCopyWith(SaveAchatPagne value, $Res Function(SaveAchatPagne) _then) = _$SaveAchatPagneCopyWithImpl;
@useResult
$Res call({
 AchatPagne achatPagne
});




}
/// @nodoc
class _$SaveAchatPagneCopyWithImpl<$Res>
    implements $SaveAchatPagneCopyWith<$Res> {
  _$SaveAchatPagneCopyWithImpl(this._self, this._then);

  final SaveAchatPagne _self;
  final $Res Function(SaveAchatPagne) _then;

/// Create a copy of AchatPagneEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? achatPagne = null,}) {
  return _then(SaveAchatPagne(
achatPagne: null == achatPagne ? _self.achatPagne : achatPagne // ignore: cast_nullable_to_non_nullable
as AchatPagne,
  ));
}


}

/// @nodoc


class UpdateAchatPagne implements AchatPagneEvent {
  const UpdateAchatPagne({required this.achatPagne});
  

 final  AchatPagne achatPagne;

/// Create a copy of AchatPagneEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateAchatPagneCopyWith<UpdateAchatPagne> get copyWith => _$UpdateAchatPagneCopyWithImpl<UpdateAchatPagne>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAchatPagne&&(identical(other.achatPagne, achatPagne) || other.achatPagne == achatPagne));
}


@override
int get hashCode => Object.hash(runtimeType,achatPagne);

@override
String toString() {
  return 'AchatPagneEvent.updateAchatPagne(achatPagne: $achatPagne)';
}


}

/// @nodoc
abstract mixin class $UpdateAchatPagneCopyWith<$Res> implements $AchatPagneEventCopyWith<$Res> {
  factory $UpdateAchatPagneCopyWith(UpdateAchatPagne value, $Res Function(UpdateAchatPagne) _then) = _$UpdateAchatPagneCopyWithImpl;
@useResult
$Res call({
 AchatPagne achatPagne
});




}
/// @nodoc
class _$UpdateAchatPagneCopyWithImpl<$Res>
    implements $UpdateAchatPagneCopyWith<$Res> {
  _$UpdateAchatPagneCopyWithImpl(this._self, this._then);

  final UpdateAchatPagne _self;
  final $Res Function(UpdateAchatPagne) _then;

/// Create a copy of AchatPagneEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? achatPagne = null,}) {
  return _then(UpdateAchatPagne(
achatPagne: null == achatPagne ? _self.achatPagne : achatPagne // ignore: cast_nullable_to_non_nullable
as AchatPagne,
  ));
}


}

/// @nodoc


class DeleteAchatPagne implements AchatPagneEvent {
  const DeleteAchatPagne({required this.achatPagne});
  

 final  AchatPagne achatPagne;

/// Create a copy of AchatPagneEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteAchatPagneCopyWith<DeleteAchatPagne> get copyWith => _$DeleteAchatPagneCopyWithImpl<DeleteAchatPagne>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteAchatPagne&&(identical(other.achatPagne, achatPagne) || other.achatPagne == achatPagne));
}


@override
int get hashCode => Object.hash(runtimeType,achatPagne);

@override
String toString() {
  return 'AchatPagneEvent.deleteAchatPagne(achatPagne: $achatPagne)';
}


}

/// @nodoc
abstract mixin class $DeleteAchatPagneCopyWith<$Res> implements $AchatPagneEventCopyWith<$Res> {
  factory $DeleteAchatPagneCopyWith(DeleteAchatPagne value, $Res Function(DeleteAchatPagne) _then) = _$DeleteAchatPagneCopyWithImpl;
@useResult
$Res call({
 AchatPagne achatPagne
});




}
/// @nodoc
class _$DeleteAchatPagneCopyWithImpl<$Res>
    implements $DeleteAchatPagneCopyWith<$Res> {
  _$DeleteAchatPagneCopyWithImpl(this._self, this._then);

  final DeleteAchatPagne _self;
  final $Res Function(DeleteAchatPagne) _then;

/// Create a copy of AchatPagneEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? achatPagne = null,}) {
  return _then(DeleteAchatPagne(
achatPagne: null == achatPagne ? _self.achatPagne : achatPagne // ignore: cast_nullable_to_non_nullable
as AchatPagne,
  ));
}


}

/// @nodoc


class DeleteAllAchatPagnes implements AchatPagneEvent {
  const DeleteAllAchatPagnes();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteAllAchatPagnes);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AchatPagneEvent.deleteAllAchatPagnes()';
}


}




/// @nodoc
mixin _$AchatPagneState {

 List<AchatPagne>? get achatPagnes; List<AchatPagne>? get vicariatAchatPagnes; bool get showErrorMessages; bool get isLoading; bool get isSubmitable; AchatPagne? get currentAchatPagne; String? get verificationId; AchatPagneAction? get action; Option<Either<GlobalFailure, Unit>> get failureOrSuccessOption;
/// Create a copy of AchatPagneState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AchatPagneStateCopyWith<AchatPagneState> get copyWith => _$AchatPagneStateCopyWithImpl<AchatPagneState>(this as AchatPagneState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AchatPagneState&&const DeepCollectionEquality().equals(other.achatPagnes, achatPagnes)&&const DeepCollectionEquality().equals(other.vicariatAchatPagnes, vicariatAchatPagnes)&&(identical(other.showErrorMessages, showErrorMessages) || other.showErrorMessages == showErrorMessages)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSubmitable, isSubmitable) || other.isSubmitable == isSubmitable)&&(identical(other.currentAchatPagne, currentAchatPagne) || other.currentAchatPagne == currentAchatPagne)&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.action, action) || other.action == action)&&(identical(other.failureOrSuccessOption, failureOrSuccessOption) || other.failureOrSuccessOption == failureOrSuccessOption));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(achatPagnes),const DeepCollectionEquality().hash(vicariatAchatPagnes),showErrorMessages,isLoading,isSubmitable,currentAchatPagne,verificationId,action,failureOrSuccessOption);

@override
String toString() {
  return 'AchatPagneState(achatPagnes: $achatPagnes, vicariatAchatPagnes: $vicariatAchatPagnes, showErrorMessages: $showErrorMessages, isLoading: $isLoading, isSubmitable: $isSubmitable, currentAchatPagne: $currentAchatPagne, verificationId: $verificationId, action: $action, failureOrSuccessOption: $failureOrSuccessOption)';
}


}

/// @nodoc
abstract mixin class $AchatPagneStateCopyWith<$Res>  {
  factory $AchatPagneStateCopyWith(AchatPagneState value, $Res Function(AchatPagneState) _then) = _$AchatPagneStateCopyWithImpl;
@useResult
$Res call({
 List<AchatPagne>? achatPagnes, List<AchatPagne>? vicariatAchatPagnes, bool showErrorMessages, bool isLoading, bool isSubmitable, AchatPagne? currentAchatPagne, String? verificationId, AchatPagneAction? action, Option<Either<GlobalFailure, Unit>> failureOrSuccessOption
});




}
/// @nodoc
class _$AchatPagneStateCopyWithImpl<$Res>
    implements $AchatPagneStateCopyWith<$Res> {
  _$AchatPagneStateCopyWithImpl(this._self, this._then);

  final AchatPagneState _self;
  final $Res Function(AchatPagneState) _then;

/// Create a copy of AchatPagneState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? achatPagnes = freezed,Object? vicariatAchatPagnes = freezed,Object? showErrorMessages = null,Object? isLoading = null,Object? isSubmitable = null,Object? currentAchatPagne = freezed,Object? verificationId = freezed,Object? action = freezed,Object? failureOrSuccessOption = null,}) {
  return _then(_self.copyWith(
achatPagnes: freezed == achatPagnes ? _self.achatPagnes : achatPagnes // ignore: cast_nullable_to_non_nullable
as List<AchatPagne>?,vicariatAchatPagnes: freezed == vicariatAchatPagnes ? _self.vicariatAchatPagnes : vicariatAchatPagnes // ignore: cast_nullable_to_non_nullable
as List<AchatPagne>?,showErrorMessages: null == showErrorMessages ? _self.showErrorMessages : showErrorMessages // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSubmitable: null == isSubmitable ? _self.isSubmitable : isSubmitable // ignore: cast_nullable_to_non_nullable
as bool,currentAchatPagne: freezed == currentAchatPagne ? _self.currentAchatPagne : currentAchatPagne // ignore: cast_nullable_to_non_nullable
as AchatPagne?,verificationId: freezed == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String?,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as AchatPagneAction?,failureOrSuccessOption: null == failureOrSuccessOption ? _self.failureOrSuccessOption : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, Unit>>,
  ));
}

}


/// @nodoc


class _AchatPagneState implements AchatPagneState {
  const _AchatPagneState({required final  List<AchatPagne>? achatPagnes, required final  List<AchatPagne>? vicariatAchatPagnes, required this.showErrorMessages, required this.isLoading, required this.isSubmitable, this.currentAchatPagne, required this.verificationId, this.action, required this.failureOrSuccessOption}): _achatPagnes = achatPagnes,_vicariatAchatPagnes = vicariatAchatPagnes;
  

 final  List<AchatPagne>? _achatPagnes;
@override List<AchatPagne>? get achatPagnes {
  final value = _achatPagnes;
  if (value == null) return null;
  if (_achatPagnes is EqualUnmodifiableListView) return _achatPagnes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<AchatPagne>? _vicariatAchatPagnes;
@override List<AchatPagne>? get vicariatAchatPagnes {
  final value = _vicariatAchatPagnes;
  if (value == null) return null;
  if (_vicariatAchatPagnes is EqualUnmodifiableListView) return _vicariatAchatPagnes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool showErrorMessages;
@override final  bool isLoading;
@override final  bool isSubmitable;
@override final  AchatPagne? currentAchatPagne;
@override final  String? verificationId;
@override final  AchatPagneAction? action;
@override final  Option<Either<GlobalFailure, Unit>> failureOrSuccessOption;

/// Create a copy of AchatPagneState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AchatPagneStateCopyWith<_AchatPagneState> get copyWith => __$AchatPagneStateCopyWithImpl<_AchatPagneState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AchatPagneState&&const DeepCollectionEquality().equals(other._achatPagnes, _achatPagnes)&&const DeepCollectionEquality().equals(other._vicariatAchatPagnes, _vicariatAchatPagnes)&&(identical(other.showErrorMessages, showErrorMessages) || other.showErrorMessages == showErrorMessages)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSubmitable, isSubmitable) || other.isSubmitable == isSubmitable)&&(identical(other.currentAchatPagne, currentAchatPagne) || other.currentAchatPagne == currentAchatPagne)&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.action, action) || other.action == action)&&(identical(other.failureOrSuccessOption, failureOrSuccessOption) || other.failureOrSuccessOption == failureOrSuccessOption));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_achatPagnes),const DeepCollectionEquality().hash(_vicariatAchatPagnes),showErrorMessages,isLoading,isSubmitable,currentAchatPagne,verificationId,action,failureOrSuccessOption);

@override
String toString() {
  return 'AchatPagneState(achatPagnes: $achatPagnes, vicariatAchatPagnes: $vicariatAchatPagnes, showErrorMessages: $showErrorMessages, isLoading: $isLoading, isSubmitable: $isSubmitable, currentAchatPagne: $currentAchatPagne, verificationId: $verificationId, action: $action, failureOrSuccessOption: $failureOrSuccessOption)';
}


}

/// @nodoc
abstract mixin class _$AchatPagneStateCopyWith<$Res> implements $AchatPagneStateCopyWith<$Res> {
  factory _$AchatPagneStateCopyWith(_AchatPagneState value, $Res Function(_AchatPagneState) _then) = __$AchatPagneStateCopyWithImpl;
@override @useResult
$Res call({
 List<AchatPagne>? achatPagnes, List<AchatPagne>? vicariatAchatPagnes, bool showErrorMessages, bool isLoading, bool isSubmitable, AchatPagne? currentAchatPagne, String? verificationId, AchatPagneAction? action, Option<Either<GlobalFailure, Unit>> failureOrSuccessOption
});




}
/// @nodoc
class __$AchatPagneStateCopyWithImpl<$Res>
    implements _$AchatPagneStateCopyWith<$Res> {
  __$AchatPagneStateCopyWithImpl(this._self, this._then);

  final _AchatPagneState _self;
  final $Res Function(_AchatPagneState) _then;

/// Create a copy of AchatPagneState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? achatPagnes = freezed,Object? vicariatAchatPagnes = freezed,Object? showErrorMessages = null,Object? isLoading = null,Object? isSubmitable = null,Object? currentAchatPagne = freezed,Object? verificationId = freezed,Object? action = freezed,Object? failureOrSuccessOption = null,}) {
  return _then(_AchatPagneState(
achatPagnes: freezed == achatPagnes ? _self._achatPagnes : achatPagnes // ignore: cast_nullable_to_non_nullable
as List<AchatPagne>?,vicariatAchatPagnes: freezed == vicariatAchatPagnes ? _self._vicariatAchatPagnes : vicariatAchatPagnes // ignore: cast_nullable_to_non_nullable
as List<AchatPagne>?,showErrorMessages: null == showErrorMessages ? _self.showErrorMessages : showErrorMessages // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSubmitable: null == isSubmitable ? _self.isSubmitable : isSubmitable // ignore: cast_nullable_to_non_nullable
as bool,currentAchatPagne: freezed == currentAchatPagne ? _self.currentAchatPagne : currentAchatPagne // ignore: cast_nullable_to_non_nullable
as AchatPagne?,verificationId: freezed == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String?,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as AchatPagneAction?,failureOrSuccessOption: null == failureOrSuccessOption ? _self.failureOrSuccessOption : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, Unit>>,
  ));
}


}

// dart format on
