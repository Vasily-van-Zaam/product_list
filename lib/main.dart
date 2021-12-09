import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'feature/presentation/app.dart';

late SharedPreferences sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const App());
}
