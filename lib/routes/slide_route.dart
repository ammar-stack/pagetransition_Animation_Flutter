import 'package:flutter/material.dart';

enum SlideDirection { fromRight, fromLeft, fromBottom, fromTop }

/// A reusable slide transition route. `direction` decides which edge the
/// new page enters from — the same class covers all four cases the
/// module list asks for (left/right/bottom/top).
class SlideRoute extends PageRouteBuilder {
  SlideRoute({
    required Widget page,
    SlideDirection direction = SlideDirection.fromRight,
    Duration duration = const Duration(milliseconds: 400),
  }) : super(
          transitionDuration: duration,
          reverseTransitionDuration: duration,
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final Offset begin = switch (direction) {
              SlideDirection.fromRight => const Offset(1, 0),
              SlideDirection.fromLeft => const Offset(-1, 0),
              SlideDirection.fromBottom => const Offset(0, 1),
              SlideDirection.fromTop => const Offset(0, -1),
            };
            // .chain(CurveTween(...)) reshapes timing without needing a
            // separate CurvedAnimation object — useful when you're
            // already building a Tween anyway.
            final tween = Tween(begin: begin, end: Offset.zero)
                .chain(CurveTween(curve: Curves.easeOutCubic));
            return SlideTransition(position: animation.drive(tween), child: child);
          },
        );
}
