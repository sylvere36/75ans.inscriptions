import 'package:auto_route/auto_route.dart';
import 'package:madeb75/src/domain/vicariats/models/vicariat.dart';
import 'package:madeb75/src/infrastructure/_commons/network/user_session.dart';
import 'package:madeb75/src/presentation/_commons/route/app_router.gr.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_event.dart';
part 'splash_state.dart';
part 'splash_bloc.freezed.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final UserSession _userSession;
  SplashBloc(this._userSession) : super(const SplashState.loading()) {
    on<SplashEvent>((event, emit) {});
    on<StartLoading>((event, emit) async {
      Vicariat? vicariat = await _userSession.getVicariat();
      PageRouteInfo<dynamic> route =
          vicariat != null ? const HomeRoute() : const LoginRoute();

      emit(SplashState.loaded(vicariat != null, route));
    });
  }
}
