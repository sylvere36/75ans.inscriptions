// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:madeb75/src/presentation/auth/sign_in/login.dart' as _i3;
import 'package:madeb75/src/presentation/dashboard/dashboard.dart' as _i1;
import 'package:madeb75/src/presentation/home/home.dart' as _i2;
import 'package:madeb75/src/presentation/splash/splash.dart' as _i4;

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i5.PageRouteInfo<void> {
  const DashboardRoute({List<_i5.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.DashboardPage();
    },
  );
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginPage();
    },
  );
}

/// generated route for
/// [_i4.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    _i6.Key? key,
    bool? withDeepLink,
    bool? fromLogout,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         SplashRoute.name,
         args: SplashRouteArgs(
           key: key,
           withDeepLink: withDeepLink,
           fromLogout: fromLogout,
         ),
         initialChildren: children,
       );

  static const String name = 'SplashRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SplashRouteArgs>(
        orElse: () => const SplashRouteArgs(),
      );
      return _i4.SplashPage(
        key: args.key,
        withDeepLink: args.withDeepLink,
        fromLogout: args.fromLogout,
      );
    },
  );
}

class SplashRouteArgs {
  const SplashRouteArgs({this.key, this.withDeepLink, this.fromLogout});

  final _i6.Key? key;

  final bool? withDeepLink;

  final bool? fromLogout;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key, withDeepLink: $withDeepLink, fromLogout: $fromLogout}';
  }
}
