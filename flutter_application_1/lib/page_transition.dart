import 'package:flutter/material.dart';

class NoTransitionPageRoute extends PageRouteBuilder {
  final Widget page;
  NoTransitionPageRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child; // No transition
          },
        );
}