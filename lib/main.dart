import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'feature/presentation/app.dart';
import 'di.dart' as di;

late SharedPreferences sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.int();
  sharedPreferences = await SharedPreferences.getInstance();

  runApp(const App());
}
