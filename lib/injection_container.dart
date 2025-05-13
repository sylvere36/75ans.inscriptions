import 'package:madeb75/src/application/auth/login/login_bloc.dart';
import 'package:madeb75/src/application/connected/connected_bloc.dart';
import 'package:madeb75/src/application/participant/participant_bloc.dart';
import 'package:madeb75/src/application/splash/splash_bloc.dart';
import 'package:madeb75/src/domain/auth/_commons/i_auth_repository.dart';
import 'package:madeb75/src/domain/participant/i_participant_repository.dart';
import 'package:madeb75/src/infrastructure/_commons/network/app_requests.dart';
import 'package:madeb75/src/infrastructure/_commons/network/network_info.dart';
import 'package:madeb75/src/infrastructure/_commons/network/user_session.dart';
import 'package:madeb75/src/infrastructure/auth/auth_repository.dart';
import 'package:madeb75/src/infrastructure/auth/data_sources/auth_local_data_source.dart';
import 'package:madeb75/src/infrastructure/auth/data_sources/auth_remote_data_source.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:madeb75/src/infrastructure/participant/data_sources/participant_remote_data_source.dart';
import 'package:madeb75/src/infrastructure/participant/participant_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  initCore();
  initSplashScreen();
  initAuth();
  initConnected();
  initParticipant();
}

void initSplashScreen() {
  sl.registerFactory(() => SplashBloc(sl()));
}

void initCore() async {
  sl.registerFactory(() => Connectivity());
  sl.registerFactory(() => UserSession());
  sl.registerLazySingleton<INetworkInfo>(() => NetworkInfo(connectivity: sl()));
  final sharedPreferences = await SharedPreferences.getInstance();
  //final firebaseMessaging = FirebaseMessaging.instance;
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  //sl.registerLazySingleton<FirebaseMessaging>(() => firebaseMessaging);
  sl.registerLazySingleton<IAppRequests>(() => AppRequests());
}

void initAuth() async {
  sl.registerLazySingleton<IAuthLocalDataSource>(
    () => AuthLocalDataSource(sharedPreferences: sl(), userSession: sl()),
  );
  sl.registerLazySingleton<IAuthRemoteDataSource>(
    () => AuthRemoteDataSource(httpClient: sl()),
  );
  sl.registerLazySingleton<IAuthRepository>(
    () => AuthRepository(
      networkInfo: sl(),
      localDataSource: sl(),
      remoteDataSource: sl(),
    ),
  );
  sl.registerFactory(() => LoginBloc(repository: sl(), userSession: sl()));
}

void initParticipant() async {
  sl.registerLazySingleton<IParticipantRemoteDataSource>(
    () => ParticipantRemoteDataSource(),
  );
  sl.registerLazySingleton<IParticipantRepository>(
    () => ParticipantRepository(networkInfo: sl(), remoteDataSource: sl()),
  );
  sl.registerFactory(() => ParticipantBloc(repository: sl()));
}

void initConnected() async {
  sl.registerFactory(() => ConnectedBloc());
}
