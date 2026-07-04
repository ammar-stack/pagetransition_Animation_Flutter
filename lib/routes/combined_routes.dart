import 'package:flutter/material.dart';

/// COMBINED 1 — Fade + Slide.
///
/// Both animations share the SAME CurvedAnimation so they stay perfectly
/// in sync — a common mistake is giving each effect its own curve/timing,
/// which makes the transition look uncoordinated even if each piece
/// looks fine in isolation.
class FadeSlideRoute extends PageRouteBuilder {
  FadeSlideRoute({
    required Widget page,
    Duration duration = const Duration(milliseconds: 450),
  }) : super(
          transitionDuration: duration,
          reverseTransitionDuration: duration,
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curved = CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);
            return FadeTransition(
              opacity: curved,
              child: SlideTransition(
                position: Tween<Offset>(begin: const Offset(0, 0.15), end: Offset.zero)
                    .animate(curved),
                child: child,
              ),
            );
          },
        );
}

/// COMBINED 2 — Scale + Rotation.
///
/// A small counter-rotation (0.15 turns ≈ 54°) paired with a scale-up
/// reads as a "pop open" effect — much more usable than rotation alone.
class ScaleRotationRoute extends PageRouteBuilder {
  ScaleRotationRoute({
    required Widget page,
    Duration duration = const Duration(milliseconds: 500),
  }) : super(
          transitionDuration: duration,
          reverseTransitionDuration: duration,
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curved = CurvedAnimation(parent: animation, curve: Curves.easeOutBack);
            return RotationTransition(
              turns: Tween<double>(begin: 0.15, end: 0.0).animate(curved),
              child: ScaleTransition(scale: curved, child: child),
            );
          },
        );
}
