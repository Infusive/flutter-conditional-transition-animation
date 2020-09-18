import 'package:example_before/pages.dart';
import 'package:example_before/route_transitions.dart';
import 'package:flutter/material.dart';

class MyRoute {
  /// Basic Route Name constants
  static const String homePage = '/home-page';
  static const String secondPage = '/second-page';
  static const String thirdPage = '/third-page';
}

/// Function which is required by MaterialApp parameter: onGenerateRoute
/// We have it separated here just so it is easier to look at.
Route<dynamic> myOnGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case MyRoute.homePage:
      return PageRouteBuilder(
        pageBuilder: (context, _, __) => HomePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            MyRouteTransitions().myFadeTransition(
                context, animation, secondaryAnimation, child),
      );
      break;
    case MyRoute.secondPage:
      return PageRouteBuilder(
        pageBuilder: (context, _, __) => SecondPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            MyRouteTransitions().mySlideTransition(
                context, animation, secondaryAnimation, child),
      );
      break;
    case MyRoute.thirdPage:
      return PageRouteBuilder(
        pageBuilder: (context, _, __) => ThirdPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            MyRouteTransitions().myFadeTransition(
                context, animation, secondaryAnimation, child),
      );
      break;
    default:
      return null;
  }
}
