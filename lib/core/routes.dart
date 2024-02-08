import 'package:flutter/material.dart';
import 'package:promilo/presentation/authentication/login.dart';
import 'package:promilo/presentation/details/trending_details.dart';
import 'package:promilo/presentation/home/home_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomeScreen.routeName:
        {
          return _route(HomeScreen(), routeSettings);
        }
        case TrendingDetailsScreen.routeName:
        {
          return _route(TrendingDetailsScreen(), routeSettings);
        }
        case LoginScreen.routeName:
        {
          return _route(LoginScreen(), routeSettings);
        }
      default:
        return _route(LoginScreen(), routeSettings);
    }
  }

  static Route _route(Widget widget, RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (_) => widget,
      settings: routeSettings,
    );
  }
}
