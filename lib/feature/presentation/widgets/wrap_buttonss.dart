import 'package:flutter/material.dart';

class WrapButtons extends StatelessWidget {
  final Widget? prefix;
  final Widget? sufix;
  final Widget body;
  const WrapButtons({Key? key, this.prefix, this.sufix, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        body,
        Positioned(
          top: 5,
          left: 0,
          child: prefix ?? const Text(''),
        ),
        Positioned(
          right: 5,
          top: 5,
          child: sufix ?? const Text(''),
        ),
      ],
    );
  }
}
