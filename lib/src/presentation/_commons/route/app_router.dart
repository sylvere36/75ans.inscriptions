import 'package:auto_route/auto_route.dart';
import 'package:madeb75/src/presentation/_commons/route/app_router.gr.dart';
import 'package:madeb75/src/presentation/auth/sign_in/login.dart';
import 'package:madeb75/src/presentation/dashboard/dashboard.dart';
import 'package:madeb75/src/presentation/home/home.dart';
import 'package:madeb75/src/presentation/splash/splash.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: SplashRoute.page,
      initial: true,
      path: SplashPage.routeName,
    ),
    AutoRoute(page: HomeRoute.page, path: HomePage.routeName),
    AutoRoute(page: LoginRoute.page, path: LoginPage.routeName),
    AutoRoute(page: DashboardRoute.page, path: DashboardPage.routeName),
  ];
}
