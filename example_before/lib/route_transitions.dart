import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class MyRouteTransitions {
  /// transitionsBuilder widget:
  Widget myFadeTransition(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    /// Animation variables
    double start = 0.0;
    double finish = 1.0;

    /// Fade In configuration
    var entryOpacity = Tween(begin: start, end: finish);
    var entryAnimation = entryOpacity
        .animate(CurvedAnimation(parent: animation, curve: Curves.linear));

    /// Fade Out configuration
    var exitOpacity = Tween(begin: finish, end: start);
    var exitAnimation = exitOpacity.animate(
        CurvedAnimation(parent: secondaryAnimation, curve: Curves.linear));

    /// Finally return both animations.
    return FadeTransition(
      opacity: entryAnimation,
      child: FadeTransition(
        opacity: exitAnimation,
        child: child,
      ),
    );
  }

  Widget mySlideTransition(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    /// Animation variables
    double xAxis = 0.0;
    double yAxisStartBelow = 1.0;
    double yAxisLand = 0.0;

    /// Slide in from bottom
    var entrySlide = Tween<Offset>(
        begin: Offset(xAxis, yAxisStartBelow), end: Offset(xAxis, yAxisLand));
    var entryAnimation = entrySlide
        .animate(CurvedAnimation(parent: animation, curve: Curves.linear));

    /// Slide out towards top
    var exitSlide = Tween<Offset>(
        begin: Offset(xAxis, yAxisLand), end: Offset(xAxis, -yAxisStartBelow));
    var exitAnimation = exitSlide.animate(
        CurvedAnimation(parent: secondaryAnimation, curve: Curves.linear));

    /// Finally return both animations
    return SlideTransition(
      position: entryAnimation,
      child: SlideTransition(
        position: exitAnimation,
        child: child,
      ),
    );
  }
}
