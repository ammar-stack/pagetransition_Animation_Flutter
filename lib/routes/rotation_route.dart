import 'package:flutter/material.dart';

/// A reusable rotation transition route. Rotating a full-screen page
/// around its center will clip the corners during the animation —
/// that's expected and is exactly why rotation alone is rarely used for
/// full-page transitions in production (see Common Mistakes / Bonus tips).
class RotationRoute extends PageRouteBuilder {
  RotationRoute({
    required Widget page,
    Duration duration = const Duration(milliseconds: 500),
  }) : super(
          transitionDuration: duration,
          reverseTransitionDuration: duration,
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return RotationTransition(
              turns: Tween<double>(begin: 0.75, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
              ),
              child: child,
            );
          },
        );
}
