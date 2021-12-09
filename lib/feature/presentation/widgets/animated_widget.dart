import 'package:flutter/material.dart';

Widget animatedSwitcherSlideTransition(
        Widget child, Animation<double> animation) =>
    SlideTransition(
      child: child,
      position: Tween(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(animation),
    );
Widget animatedSwitcherScaleTransition(
        Widget child, Animation<double> animation) =>
    ScaleTransition(scale: animation, child: child);
