import 'package:flutter/material.dart';

/// A reusable scale (zoom) transition route. `easeOutBack` gives it a
/// slight overshoot, which reads as more "alive" than a linear zoom.
class ScaleRoute extends PageRouteBuilder {
  ScaleRoute({
    required Widget page,
    Alignment alignment = Alignment.center,
    Duration duration = const Duration(milliseconds: 400),
  }) : super(
          transitionDuration: duration,
          reverseTransitionDuration: duration,
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
              alignment: alignment,
              child: child,
            );
          },
        );
}
