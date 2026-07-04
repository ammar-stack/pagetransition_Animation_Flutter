import 'package:flutter/material.dart';

/// A reusable fade transition route. Notice this class stores NOTHING —
/// `page` and `duration` are only captured inside the closures passed to
/// `super(...)`, which is enough because closures run later, once the
/// route is actually pushed.
class FadeRoute extends PageRouteBuilder {
  FadeRoute({
    required Widget page,
    Duration duration = const Duration(milliseconds: 400),
  }) : super(
          transitionDuration: duration,
          reverseTransitionDuration: duration,
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
              child: child,
            );
          },
        );
}
