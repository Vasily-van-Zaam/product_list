import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/splash.png',
                width: 100,
              ),
              const Text(
                'In developing',
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
