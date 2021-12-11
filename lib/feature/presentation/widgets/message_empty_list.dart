import 'package:flutter/material.dart';

class MessageEmptyList extends StatelessWidget {
  final String message;
  const MessageEmptyList(
    this.message, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
