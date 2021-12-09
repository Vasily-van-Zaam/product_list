import 'package:flutter/material.dart';

class DissmissibleWidget<T> extends StatelessWidget {
  final T item;
  final Widget child;
  final Icon? iconLeft;
  final Icon? iconRights;
  final Color? colorLeft;
  final Color? colorRight;

  final DismissDirectionCallback onDismissed;
  const DissmissibleWidget({
    Key? key,
    required this.item,
    required this.child,
    required this.onDismissed,
    this.iconLeft,
    this.iconRights,
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: colorLeft ?? Colors.green,
        child: iconLeft ?? const Icon(Icons.done),
      );

  Widget buildSwipeActionRight() => Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: colorRight ?? Colors.red,
        child: iconRights ?? const Icon(Icons.delete),
      );
}
