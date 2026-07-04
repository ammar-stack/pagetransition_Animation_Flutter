import 'package:flutter/material.dart';

/// ADVANCED — DEPTH PUSH (correct secondaryAnimation usage).
///
/// IMPORTANT CONCEPT: `secondaryAnimation` animates a route WHILE IT IS
/// BEING COVERED by a new route pushed on top of it — it does NOT belong
/// to the incoming page. That means for a "current screen shrinks back
/// as the next one slides over it" effect, EVERY screen in the chain
/// must be pushed using this same route class — the effect only shows up
/// on a screen once something else is pushed on top of it.
class DepthPushRoute extends PageRouteBuilder {
  DepthPushRoute({
    required Widget page,
    Duration duration = const Duration(milliseconds: 450),
  }) : super(
          transitionDuration: duration,
          reverseTransitionDuration: duration,
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // `animation` (0→1): THIS page's own entrance — slides up + fades in.
            final incomingCurve = CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);
            final incoming = FadeTransition(
              opacity: incomingCurve,
              child: SlideTransition(
                position: Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero)
                    .animate(incomingCurve),
                child: child,
              ),
            );

            // `secondaryAnimation` (0→1): fires on THIS page later, once a
            // NEW page pushes on top of it — shrinks and dims it slightly
            // so it visually recedes "behind" the new page.
            final outgoingCurve = CurvedAnimation(parent: secondaryAnimation, curve: Curves.easeOutCubic);
            return AnimatedBuilder(
              animation: outgoingCurve,
              builder: (context, _) {
                final recede = outgoingCurve.value;
                return Transform.scale(
                  scale: 1 - (recede * 0.06),
                  child: Opacity(
                    opacity: 1 - (recede * 0.35),
                    child: incoming,
                  ),
                );
              },
            );
          },
        );
}
