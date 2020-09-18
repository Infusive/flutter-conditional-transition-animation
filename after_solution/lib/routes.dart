import 'package:after_solution/pages.dart';
import 'package:after_solution/route_transitions.dart';
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
      return RouteMain(
        builder: (context) => HomePage(),
        settings: routeSettings,
      );
      break;
    case MyRoute.secondPage:
      return RouteSecondPage(
        builder: (context) => SecondPage(),
        settings: routeSettings,
      );
      break;
    case MyRoute.thirdPage:
      return RouteMain(
        builder: (context) => ThirdPage(),
        settings: routeSettings,
      );
      break;
    default:
      return null;
      break;
  }
}

class RouteMain extends PageRoute {
  RouteMain({
    @required this.builder,
    RouteSettings settings,
  }) : super(
          settings: settings,
          fullscreenDialog: false,
        );

  final WidgetBuilder builder;

  @override
  bool get opaque => true;
  @override
  Color get barrierColor => null;
  @override
  String get barrierLabel => null;
  @override
  bool get maintainState => false;
  @override
  bool get canPop => false;

  @override
  Duration get transitionDuration => const Duration(seconds: 1);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  String transitionPage;

  @override
  bool canTransitionTo(TransitionRoute<dynamic> nextRoute) {
    switch (nextRoute.settings.name) {
      case MyRoute.secondPage:
        transitionPage = MyRoute.secondPage;
        return true;
      default:
        transitionPage = "";
        return true;
    }
  }

  @override
  bool canTransitionFrom(TransitionRoute<dynamic> previousRoute) {
    return true;
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (transitionPage == MyRoute.secondPage) {
      return MyRouteTransitions()
          .mySlideTransition(context, animation, secondaryAnimation, child);
    } else {
      return MyRouteTransitions()
          .myFadeTransition(context, animation, secondaryAnimation, child);
    }
  }
}

class RouteSecondPage extends PageRoute {
  RouteSecondPage({
    @required this.builder,
    RouteSettings settings,
  }) : super(
          settings: settings,
          fullscreenDialog: false,
        );

  final WidgetBuilder builder;

  @override
  bool get opaque => true;
  @override
  Color get barrierColor => null;
  @override
  String get barrierLabel => null;
  @override
  bool get maintainState => false;
  @override
  bool get canPop => true;

  @override
  Duration get transitionDuration => const Duration(seconds: 1);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return MyRouteTransitions()
        .mySlideTransition(context, animation, secondaryAnimation, child);
  }
}
