// Flutter imports:
import 'package:flutter/material.dart';

class ScaleOutTransition extends PageRouteBuilder 
{
  final Widget widget;
  Duration? duration;
  ScaleOutTransition({required this.widget, this.duration}) : super
  (
    transitionDuration: duration ?? const Duration(milliseconds: 200),
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      return widget;
    },
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      return ScaleTransition
      (
        scale: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(
              0.00,
              0.50,
              curve: Curves.linear,
            ),
          ),
        ),
        child: ScaleTransition(
          scale: Tween<double>(
            begin: 0.4,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: const Interval(
                0.50,
                1.00,
                curve: Curves.linear,
              ),
            ),
          ),
          child: child,
        ),
      );
    }
  );
}
