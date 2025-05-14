// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'atelier_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AtelierEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AtelierEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AtelierEvent()';
}


}

/// @nodoc
class $AtelierEventCopyWith<$Res>  {
$AtelierEventCopyWith(AtelierEvent _, $Res Function(AtelierEvent) __);
}


/// @nodoc


class _Started implements AtelierEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AtelierEvent.started()';
}


}




/// @nodoc


class GetAtelier implements AtelierEvent {
  const GetAtelier({required this.identifiant});
  

 final  String identifiant;

/// Create a copy of AtelierEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetAtelierCopyWith<GetAtelier> get copyWith => _$GetAtelierCopyWithImpl<GetAtelier>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAtelier&&(identical(other.identifiant, identifiant) || other.identifiant == identifiant));
}


@override
int get hashCode => Object.hash(runtimeType,identifiant);

@override
String toString() {
  return 'AtelierEvent.getAtelier(identifiant: $identifiant)';
}


}

/// @nodoc
abstract mixin class $GetAtelierCopyWith<$Res> implements $AtelierEventCopyWith<$Res> {
  factory $GetAtelierCopyWith(GetAtelier value, $Res Function(GetAtelier) _then) = _$GetAtelierCopyWithImpl;
@useResult
$Res call({
 String identifiant
});




}
/// @nodoc
class _$GetAtelierCopyWithImpl<$Res>
    implements $GetAtelierCopyWith<$Res> {
  _$GetAtelierCopyWithImpl(this._self, this._then);

  final GetAtelier _self;
  final $Res Function(GetAtelier) _then;

/// Create a copy of AtelierEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? identifiant = null,}) {
  return _then(GetAtelier(
identifiant: null == identifiant ? _self.identifiant : identifiant // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class GetAllAteliers implements AtelierEvent {
  const GetAllAteliers();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllAteliers);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AtelierEvent.getAllAteliers()';
}


}




/// @nodoc


class GetAllAteliersByVicariat implements AtelierEvent {
  const GetAllAteliersByVicariat({required this.vicariatCode});
  

 final  String vicariatCode;

/// Create a copy of AtelierEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetAllAteliersByVicariatCopyWith<GetAllAteliersByVicariat> get copyWith => _$GetAllAteliersByVicariatCopyWithImpl<GetAllAteliersByVicariat>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllAteliersByVicariat&&(identical(other.vicariatCode, vicariatCode) || other.vicariatCode == vicariatCode));
}


@override
int get hashCode => Object.hash(runtimeType,vicariatCode);

@override
String toString() {
  return 'AtelierEvent.getAllAteliersByVicariat(vicariatCode: $vicariatCode)';
}


}

/// @nodoc
abstract mixin class $GetAllAteliersByVicariatCopyWith<$Res> implements $AtelierEventCopyWith<$Res> {
  factory $GetAllAteliersByVicariatCopyWith(GetAllAteliersByVicariat value, $Res Function(GetAllAteliersByVicariat) _then) = _$GetAllAteliersByVicariatCopyWithImpl;
@useResult
$Res call({
 String vicariatCode
});




}
/// @nodoc
class _$GetAllAteliersByVicariatCopyWithImpl<$Res>
    implements $GetAllAteliersByVicariatCopyWith<$Res> {
  _$GetAllAteliersByVicariatCopyWithImpl(this._self, this._then);

  final GetAllAteliersByVicariat _self;
  final $Res Function(GetAllAteliersByVicariat) _then;

/// Create a copy of AtelierEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vicariatCode = null,}) {
  return _then(GetAllAteliersByVicariat(
vicariatCode: null == vicariatCode ? _self.vicariatCode : vicariatCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SaveAtelier implements AtelierEvent {
  const SaveAtelier({required this.atelier});
  

 final  Atelier atelier;

/// Create a copy of AtelierEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaveAtelierCopyWith<SaveAtelier> get copyWith => _$SaveAtelierCopyWithImpl<SaveAtelier>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaveAtelier&&(identical(other.atelier, atelier) || other.atelier == atelier));
}


@override
int get hashCode => Object.hash(runtimeType,atelier);

@override
String toString() {
  return 'AtelierEvent.saveAtelier(atelier: $atelier)';
}


}

/// @nodoc
abstract mixin class $SaveAtelierCopyWith<$Res> implements $AtelierEventCopyWith<$Res> {
  factory $SaveAtelierCopyWith(SaveAtelier value, $Res Function(SaveAtelier) _then) = _$SaveAtelierCopyWithImpl;
@useResult
$Res call({
 Atelier atelier
});




}
/// @nodoc
class _$SaveAtelierCopyWithImpl<$Res>
    implements $SaveAtelierCopyWith<$Res> {
  _$SaveAtelierCopyWithImpl(this._self, this._then);

  final SaveAtelier _self;
  final $Res Function(SaveAtelier) _then;

/// Create a copy of AtelierEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? atelier = null,}) {
  return _then(SaveAtelier(
atelier: null == atelier ? _self.atelier : atelier // ignore: cast_nullable_to_non_nullable
as Atelier,
  ));
}


}

/// @nodoc


class UpdateAtelier implements AtelierEvent {
  const UpdateAtelier({required this.atelier});
  

 final  Atelier atelier;

/// Create a copy of AtelierEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateAtelierCopyWith<UpdateAtelier> get copyWith => _$UpdateAtelierCopyWithImpl<UpdateAtelier>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAtelier&&(identical(other.atelier, atelier) || other.atelier == atelier));
}


@override
int get hashCode => Object.hash(runtimeType,atelier);

@override
String toString() {
  return 'AtelierEvent.updateAtelier(atelier: $atelier)';
}


}

/// @nodoc
abstract mixin class $UpdateAtelierCopyWith<$Res> implements $AtelierEventCopyWith<$Res> {
  factory $UpdateAtelierCopyWith(UpdateAtelier value, $Res Function(UpdateAtelier) _then) = _$UpdateAtelierCopyWithImpl;
@useResult
$Res call({
 Atelier atelier
});




}
/// @nodoc
class _$UpdateAtelierCopyWithImpl<$Res>
    implements $UpdateAtelierCopyWith<$Res> {
  _$UpdateAtelierCopyWithImpl(this._self, this._then);

  final UpdateAtelier _self;
  final $Res Function(UpdateAtelier) _then;

/// Create a copy of AtelierEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? atelier = null,}) {
  return _then(UpdateAtelier(
atelier: null == atelier ? _self.atelier : atelier // ignore: cast_nullable_to_non_nullable
as Atelier,
  ));
}


}

/// @nodoc


class DeleteAtelier implements AtelierEvent {
  const DeleteAtelier({required this.atelier});
  

 final  Atelier atelier;

/// Create a copy of AtelierEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteAtelierCopyWith<DeleteAtelier> get copyWith => _$DeleteAtelierCopyWithImpl<DeleteAtelier>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteAtelier&&(identical(other.atelier, atelier) || other.atelier == atelier));
}


@override
int get hashCode => Object.hash(runtimeType,atelier);

@override
String toString() {
  return 'AtelierEvent.deleteAtelier(atelier: $atelier)';
}


}

/// @nodoc
abstract mixin class $DeleteAtelierCopyWith<$Res> implements $AtelierEventCopyWith<$Res> {
  factory $DeleteAtelierCopyWith(DeleteAtelier value, $Res Function(DeleteAtelier) _then) = _$DeleteAtelierCopyWithImpl;
@useResult
$Res call({
 Atelier atelier
});




}
/// @nodoc
class _$DeleteAtelierCopyWithImpl<$Res>
    implements $DeleteAtelierCopyWith<$Res> {
  _$DeleteAtelierCopyWithImpl(this._self, this._then);

  final DeleteAtelier _self;
  final $Res Function(DeleteAtelier) _then;

/// Create a copy of AtelierEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? atelier = null,}) {
  return _then(DeleteAtelier(
atelier: null == atelier ? _self.atelier : atelier // ignore: cast_nullable_to_non_nullable
as Atelier,
  ));
}


}

/// @nodoc


class DeleteAllAteliers implements AtelierEvent {
  const DeleteAllAteliers();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteAllAteliers);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AtelierEvent.deleteAllAteliers()';
}


}




/// @nodoc
mixin _$AtelierState {

 List<Atelier>? get ateliers; List<Atelier>? get vicariatAteliers; bool get showErrorMessages; bool get isLoading; bool get isSubmitable; Atelier? get currentAtelier; String? get verificationId; AtelierAction? get action; Option<Either<GlobalFailure, Unit>> get failureOrSuccessOption;
/// Create a copy of AtelierState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AtelierStateCopyWith<AtelierState> get copyWith => _$AtelierStateCopyWithImpl<AtelierState>(this as AtelierState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AtelierState&&const DeepCollectionEquality().equals(other.ateliers, ateliers)&&const DeepCollectionEquality().equals(other.vicariatAteliers, vicariatAteliers)&&(identical(other.showErrorMessages, showErrorMessages) || other.showErrorMessages == showErrorMessages)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSubmitable, isSubmitable) || other.isSubmitable == isSubmitable)&&(identical(other.currentAtelier, currentAtelier) || other.currentAtelier == currentAtelier)&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.action, action) || other.action == action)&&(identical(other.failureOrSuccessOption, failureOrSuccessOption) || other.failureOrSuccessOption == failureOrSuccessOption));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(ateliers),const DeepCollectionEquality().hash(vicariatAteliers),showErrorMessages,isLoading,isSubmitable,currentAtelier,verificationId,action,failureOrSuccessOption);

@override
String toString() {
  return 'AtelierState(ateliers: $ateliers, vicariatAteliers: $vicariatAteliers, showErrorMessages: $showErrorMessages, isLoading: $isLoading, isSubmitable: $isSubmitable, currentAtelier: $currentAtelier, verificationId: $verificationId, action: $action, failureOrSuccessOption: $failureOrSuccessOption)';
}


}

/// @nodoc
abstract mixin class $AtelierStateCopyWith<$Res>  {
  factory $AtelierStateCopyWith(AtelierState value, $Res Function(AtelierState) _then) = _$AtelierStateCopyWithImpl;
@useResult
$Res call({
 List<Atelier>? ateliers, List<Atelier>? vicariatAteliers, bool showErrorMessages, bool isLoading, bool isSubmitable, Atelier? currentAtelier, String? verificationId, AtelierAction? action, Option<Either<GlobalFailure, Unit>> failureOrSuccessOption
});




}
/// @nodoc
class _$AtelierStateCopyWithImpl<$Res>
    implements $AtelierStateCopyWith<$Res> {
  _$AtelierStateCopyWithImpl(this._self, this._then);

  final AtelierState _self;
  final $Res Function(AtelierState) _then;

/// Create a copy of AtelierState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ateliers = freezed,Object? vicariatAteliers = freezed,Object? showErrorMessages = null,Object? isLoading = null,Object? isSubmitable = null,Object? currentAtelier = freezed,Object? verificationId = freezed,Object? action = freezed,Object? failureOrSuccessOption = null,}) {
  return _then(_self.copyWith(
ateliers: freezed == ateliers ? _self.ateliers : ateliers // ignore: cast_nullable_to_non_nullable
as List<Atelier>?,vicariatAteliers: freezed == vicariatAteliers ? _self.vicariatAteliers : vicariatAteliers // ignore: cast_nullable_to_non_nullable
as List<Atelier>?,showErrorMessages: null == showErrorMessages ? _self.showErrorMessages : showErrorMessages // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSubmitable: null == isSubmitable ? _self.isSubmitable : isSubmitable // ignore: cast_nullable_to_non_nullable
as bool,currentAtelier: freezed == currentAtelier ? _self.currentAtelier : currentAtelier // ignore: cast_nullable_to_non_nullable
as Atelier?,verificationId: freezed == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String?,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as AtelierAction?,failureOrSuccessOption: null == failureOrSuccessOption ? _self.failureOrSuccessOption : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, Unit>>,
  ));
}

}


/// @nodoc


class _AtelierState implements AtelierState {
  const _AtelierState({required final  List<Atelier>? ateliers, required final  List<Atelier>? vicariatAteliers, required this.showErrorMessages, required this.isLoading, required this.isSubmitable, this.currentAtelier, required this.verificationId, this.action, required this.failureOrSuccessOption}): _ateliers = ateliers,_vicariatAteliers = vicariatAteliers;
  

 final  List<Atelier>? _ateliers;
@override List<Atelier>? get ateliers {
  final value = _ateliers;
  if (value == null) return null;
  if (_ateliers is EqualUnmodifiableListView) return _ateliers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Atelier>? _vicariatAteliers;
@override List<Atelier>? get vicariatAteliers {
  final value = _vicariatAteliers;
  if (value == null) return null;
  if (_vicariatAteliers is EqualUnmodifiableListView) return _vicariatAteliers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool showErrorMessages;
@override final  bool isLoading;
@override final  bool isSubmitable;
@override final  Atelier? currentAtelier;
@override final  String? verificationId;
@override final  AtelierAction? action;
@override final  Option<Either<GlobalFailure, Unit>> failureOrSuccessOption;

/// Create a copy of AtelierState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AtelierStateCopyWith<_AtelierState> get copyWith => __$AtelierStateCopyWithImpl<_AtelierState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AtelierState&&const DeepCollectionEquality().equals(other._ateliers, _ateliers)&&const DeepCollectionEquality().equals(other._vicariatAteliers, _vicariatAteliers)&&(identical(other.showErrorMessages, showErrorMessages) || other.showErrorMessages == showErrorMessages)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSubmitable, isSubmitable) || other.isSubmitable == isSubmitable)&&(identical(other.currentAtelier, currentAtelier) || other.currentAtelier == currentAtelier)&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.action, action) || other.action == action)&&(identical(other.failureOrSuccessOption, failureOrSuccessOption) || other.failureOrSuccessOption == failureOrSuccessOption));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_ateliers),const DeepCollectionEquality().hash(_vicariatAteliers),showErrorMessages,isLoading,isSubmitable,currentAtelier,verificationId,action,failureOrSuccessOption);

@override
String toString() {
  return 'AtelierState(ateliers: $ateliers, vicariatAteliers: $vicariatAteliers, showErrorMessages: $showErrorMessages, isLoading: $isLoading, isSubmitable: $isSubmitable, currentAtelier: $currentAtelier, verificationId: $verificationId, action: $action, failureOrSuccessOption: $failureOrSuccessOption)';
}


}

/// @nodoc
abstract mixin class _$AtelierStateCopyWith<$Res> implements $AtelierStateCopyWith<$Res> {
  factory _$AtelierStateCopyWith(_AtelierState value, $Res Function(_AtelierState) _then) = __$AtelierStateCopyWithImpl;
@override @useResult
$Res call({
 List<Atelier>? ateliers, List<Atelier>? vicariatAteliers, bool showErrorMessages, bool isLoading, bool isSubmitable, Atelier? currentAtelier, String? verificationId, AtelierAction? action, Option<Either<GlobalFailure, Unit>> failureOrSuccessOption
});




}
/// @nodoc
class __$AtelierStateCopyWithImpl<$Res>
    implements _$AtelierStateCopyWith<$Res> {
  __$AtelierStateCopyWithImpl(this._self, this._then);

  final _AtelierState _self;
  final $Res Function(_AtelierState) _then;

/// Create a copy of AtelierState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ateliers = freezed,Object? vicariatAteliers = freezed,Object? showErrorMessages = null,Object? isLoading = null,Object? isSubmitable = null,Object? currentAtelier = freezed,Object? verificationId = freezed,Object? action = freezed,Object? failureOrSuccessOption = null,}) {
  return _then(_AtelierState(
ateliers: freezed == ateliers ? _self._ateliers : ateliers // ignore: cast_nullable_to_non_nullable
as List<Atelier>?,vicariatAteliers: freezed == vicariatAteliers ? _self._vicariatAteliers : vicariatAteliers // ignore: cast_nullable_to_non_nullable
as List<Atelier>?,showErrorMessages: null == showErrorMessages ? _self.showErrorMessages : showErrorMessages // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSubmitable: null == isSubmitable ? _self.isSubmitable : isSubmitable // ignore: cast_nullable_to_non_nullable
as bool,currentAtelier: freezed == currentAtelier ? _self.currentAtelier : currentAtelier // ignore: cast_nullable_to_non_nullable
as Atelier?,verificationId: freezed == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String?,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as AtelierAction?,failureOrSuccessOption: null == failureOrSuccessOption ? _self.failureOrSuccessOption : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
as Option<Either<GlobalFailure, Unit>>,
  ));
}


}

// dart format on
