import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insta_app/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  userId = prefs!.getString("id");
  print(userId);

  runApp(app());
}

initialize() async {
  prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
}
