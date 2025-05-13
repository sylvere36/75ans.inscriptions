import 'dart:convert';

import 'package:madeb75/gen/assets.gen.dart';
import 'package:madeb75/src/domain/auth/_commons/i_auth_repository.dart';
import 'package:madeb75/src/domain/auth/failure/auth_failure.dart';
import 'package:madeb75/src/domain/vicariats/models/vicariat.dart';
import 'package:madeb75/src/infrastructure/_commons/network/user_session.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  IAuthRepository repository;
  final UserSession userSession;
  LoginBloc({required this.repository, required this.userSession})
    : super(LoginState.initial()) {
    on<LoadVicariats>(loadVicariats);
    on<Submit>(_submit);
  }

  void loadVicariats(LoadVicariats event, Emitter<LoginState> emit) async {
    final String response = await rootBundle.loadString(Assets.json.vicariats);
    final List<dynamic> data = jsonDecode(response);

    List<Vicariat> vicariats =
        data.map((item) => Vicariat.fromMap(item)).toList();

    emit(
      state.copyWith(
        vicariats: vicariats,
        isSubmitable: true,
        clickType: 'vicariat',
      ),
    );
  }

  void _submit(Submit event, Emitter<LoginState> emit) async {
    if (event.vicariat.authCode.toString() != event.code) {
      emit(
        state.copyWith(
          showErrorMessages: true,
          errorMessage: 'Code vicariat incorrect',
        ),
      );
      emit(
        state.copyWith(
          showErrorMessages: false,
          errorMessage: null,
          authFailureOrSuccessOption: none(),
        ),
      );
      return;
    }
    await userSession.setVicariat(event.vicariat);
    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessages: false,
        isLoggedIn: true,
        authFailureOrSuccessOption: some(const Right(unit)),
      ),
    );
    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessages: false,
        isLoggedIn: null,
        authFailureOrSuccessOption: none(),
      ),
    );
  }
}
