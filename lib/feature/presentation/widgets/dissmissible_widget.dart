import 'package:flutter/material.dart';

class DissmissibleWidget<T> extends StatelessWidget {
  final T item;
  final Widget child;
  final Icon? iconLeft;
  final Icon? iconRight;
  final Color? colorLeft;
  final Color? colorRight;

  final DismissDirectionCallback onDismissed;
  const DissmissibleWidget({
    Key? key,
    required this.item,
    required this.child,
    required this.onDismissed,
    this.iconLeft,
    this.iconRight,
    this.colorLeft,
    this.colorRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Dismissible(
        key: ObjectKey(item),
        child: child,
        background: buildSwipeActionLeft(),
        secondaryBackground: buildSwipeActionRight(),
        onDismissed: onDismissed,
      );

  Widget buildSwipeActionLeft() => Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        color: colorLeft ?? Colors.green,
        child:
            iconLeft ?? const Icon(Icons.done, color: Colors.white, size: 40),
      );

  Widget buildSwipeActionRight() => Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        color: colorRight ?? Colors.red,
        child: iconRight ??
            const Icon(Icons.delete, color: Colors.white, size: 40),
      );
}
