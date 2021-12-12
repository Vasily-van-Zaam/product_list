import 'package:flutter/material.dart';

class MessageEmptyList extends StatelessWidget {
  final String message;
  final Function()? onTap;
  const MessageEmptyList(
    this.message, {
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/splash.png',
                  width: 100,
                ),
                SizedBox(
                  width: 150,
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
