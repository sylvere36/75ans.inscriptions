// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent()';
}


}

/// @nodoc
class $LoginEventCopyWith<$Res>  {
$LoginEventCopyWith(LoginEvent _, $Res Function(LoginEvent) __);
}


/// @nodoc


class _Started implements LoginEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.started()';
}


}




/// @nodoc


class LoadVicariats implements LoginEvent {
  const LoadVicariats();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadVicariats);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.loadVicariats()';
}


}




/// @nodoc


class Submit implements LoginEvent {
  const Submit({required this.vicariat, required this.code});
  

 final  Vicariat vicariat;
 final  String code;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitCopyWith<Submit> get copyWith => _$SubmitCopyWithImpl<Submit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Submit&&(identical(other.vicariat, vicariat) || other.vicariat == vicariat)&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode => Object.hash(runtimeType,vicariat,code);

@override
String toString() {
  return 'LoginEvent.submit(vicariat: $vicariat, code: $code)';
}


}

/// @nodoc
abstract mixin class $SubmitCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory $SubmitCopyWith(Submit value, $Res Function(Submit) _then) = _$SubmitCopyWithImpl;
@useResult
$Res call({
 Vicariat vicariat, String code
});




}
/// @nodoc
class _$SubmitCopyWithImpl<$Res>
    implements $SubmitCopyWith<$Res> {
  _$SubmitCopyWithImpl(this._self, this._then);

  final Submit _self;
  final $Res Function(Submit) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vicariat = null,Object? code = null,}) {
  return _then(Submit(
vicariat: null == vicariat ? _self.vicariat : vicariat // ignore: cast_nullable_to_non_nullable
as Vicariat,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$LoginState {

 bool get showErrorMessages; bool get isSubmitting; bool get isSubmitable; String get clickType; bool? get restartApp; List<Vicariat>? get vicariats; String? get errorMessage; bool? get isLoggedIn; Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption;
/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginStateCopyWith<LoginState> get copyWith => _$LoginStateCopyWithImpl<LoginState>(this as LoginState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState&&(identical(other.showErrorMessages, showErrorMessages) || other.showErrorMessages == showErrorMessages)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isSubmitable, isSubmitable) || other.isSubmitable == isSubmitable)&&(identical(other.clickType, clickType) || other.clickType == clickType)&&(identical(other.restartApp, restartApp) || other.restartApp == restartApp)&&const DeepCollectionEquality().equals(other.vicariats, vicariats)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isLoggedIn, isLoggedIn) || other.isLoggedIn == isLoggedIn)&&(identical(other.authFailureOrSuccessOption, authFailureOrSuccessOption) || other.authFailureOrSuccessOption == authFailureOrSuccessOption));
}


@override
int get hashCode => Object.hash(runtimeType,showErrorMessages,isSubmitting,isSubmitable,clickType,restartApp,const DeepCollectionEquality().hash(vicariats),errorMessage,isLoggedIn,authFailureOrSuccessOption);

@override
String toString() {
  return 'LoginState(showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, isSubmitable: $isSubmitable, clickType: $clickType, restartApp: $restartApp, vicariats: $vicariats, errorMessage: $errorMessage, isLoggedIn: $isLoggedIn, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
}


}

/// @nodoc
abstract mixin class $LoginStateCopyWith<$Res>  {
  factory $LoginStateCopyWith(LoginState value, $Res Function(LoginState) _then) = _$LoginStateCopyWithImpl;
@useResult
$Res call({
 bool showErrorMessages, bool isSubmitting, bool isSubmitable, String clickType, bool? restartApp, List<Vicariat>? vicariats, String? errorMessage, bool? isLoggedIn, Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption
});




}
/// @nodoc
class _$LoginStateCopyWithImpl<$Res>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._self, this._then);

  final LoginState _self;
  final $Res Function(LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? showErrorMessages = null,Object? isSubmitting = null,Object? isSubmitable = null,Object? clickType = null,Object? restartApp = freezed,Object? vicariats = freezed,Object? errorMessage = freezed,Object? isLoggedIn = freezed,Object? authFailureOrSuccessOption = null,}) {
  return _then(_self.copyWith(
showErrorMessages: null == showErrorMessages ? _self.showErrorMessages : showErrorMessages // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isSubmitable: null == isSubmitable ? _self.isSubmitable : isSubmitable // ignore: cast_nullable_to_non_nullable
as bool,clickType: null == clickType ? _self.clickType : clickType // ignore: cast_nullable_to_non_nullable
as String,restartApp: freezed == restartApp ? _self.restartApp : restartApp // ignore: cast_nullable_to_non_nullable
as bool?,vicariats: freezed == vicariats ? _self.vicariats : vicariats // ignore: cast_nullable_to_non_nullable
as List<Vicariat>?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isLoggedIn: freezed == isLoggedIn ? _self.isLoggedIn : isLoggedIn // ignore: cast_nullable_to_non_nullable
as bool?,authFailureOrSuccessOption: null == authFailureOrSuccessOption ? _self.authFailureOrSuccessOption : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
as Option<Either<AuthFailure, Unit>>,
  ));
}

}


/// @nodoc


class _LoginState implements LoginState {
  const _LoginState({required this.showErrorMessages, required this.isSubmitting, required this.isSubmitable, required this.clickType, required this.restartApp, final  List<Vicariat>? vicariats, this.errorMessage, this.isLoggedIn, required this.authFailureOrSuccessOption}): _vicariats = vicariats;
  

@override final  bool showErrorMessages;
@override final  bool isSubmitting;
@override final  bool isSubmitable;
@override final  String clickType;
@override final  bool? restartApp;
 final  List<Vicariat>? _vicariats;
@override List<Vicariat>? get vicariats {
  final value = _vicariats;
  if (value == null) return null;
  if (_vicariats is EqualUnmodifiableListView) return _vicariats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? errorMessage;
@override final  bool? isLoggedIn;
@override final  Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginStateCopyWith<_LoginState> get copyWith => __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginState&&(identical(other.showErrorMessages, showErrorMessages) || other.showErrorMessages == showErrorMessages)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isSubmitable, isSubmitable) || other.isSubmitable == isSubmitable)&&(identical(other.clickType, clickType) || other.clickType == clickType)&&(identical(other.restartApp, restartApp) || other.restartApp == restartApp)&&const DeepCollectionEquality().equals(other._vicariats, _vicariats)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isLoggedIn, isLoggedIn) || other.isLoggedIn == isLoggedIn)&&(identical(other.authFailureOrSuccessOption, authFailureOrSuccessOption) || other.authFailureOrSuccessOption == authFailureOrSuccessOption));
}


@override
int get hashCode => Object.hash(runtimeType,showErrorMessages,isSubmitting,isSubmitable,clickType,restartApp,const DeepCollectionEquality().hash(_vicariats),errorMessage,isLoggedIn,authFailureOrSuccessOption);

@override
String toString() {
  return 'LoginState(showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, isSubmitable: $isSubmitable, clickType: $clickType, restartApp: $restartApp, vicariats: $vicariats, errorMessage: $errorMessage, isLoggedIn: $isLoggedIn, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
}


}

/// @nodoc
abstract mixin class _$LoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(_LoginState value, $Res Function(_LoginState) _then) = __$LoginStateCopyWithImpl;
@override @useResult
$Res call({
 bool showErrorMessages, bool isSubmitting, bool isSubmitable, String clickType, bool? restartApp, List<Vicariat>? vicariats, String? errorMessage, bool? isLoggedIn, Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption
});




}
/// @nodoc
class __$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(this._self, this._then);

  final _LoginState _self;
  final $Res Function(_LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? showErrorMessages = null,Object? isSubmitting = null,Object? isSubmitable = null,Object? clickType = null,Object? restartApp = freezed,Object? vicariats = freezed,Object? errorMessage = freezed,Object? isLoggedIn = freezed,Object? authFailureOrSuccessOption = null,}) {
  return _then(_LoginState(
showErrorMessages: null == showErrorMessages ? _self.showErrorMessages : showErrorMessages // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isSubmitable: null == isSubmitable ? _self.isSubmitable : isSubmitable // ignore: cast_nullable_to_non_nullable
as bool,clickType: null == clickType ? _self.clickType : clickType // ignore: cast_nullable_to_non_nullable
as String,restartApp: freezed == restartApp ? _self.restartApp : restartApp // ignore: cast_nullable_to_non_nullable
as bool?,vicariats: freezed == vicariats ? _self._vicariats : vicariats // ignore: cast_nullable_to_non_nullable
as List<Vicariat>?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isLoggedIn: freezed == isLoggedIn ? _self.isLoggedIn : isLoggedIn // ignore: cast_nullable_to_non_nullable
as bool?,authFailureOrSuccessOption: null == authFailureOrSuccessOption ? _self.authFailureOrSuccessOption : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
as Option<Either<AuthFailure, Unit>>,
  ));
}


}

// dart format on
