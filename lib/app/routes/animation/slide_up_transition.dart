// Flutter imports:
import 'package:flutter/material.dart';

class SlideUpTransition extends PageRouteBuilder 
{
  final Widget widget;
  Duration? duration;
  SlideUpTransition({required this.widget, this.duration}) : super
  (
    transitionDuration: duration ?? const Duration(milliseconds: 200),
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      return widget;
    },
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    }
  );
}
