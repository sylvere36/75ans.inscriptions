import 'package:madeb75/src/presentation/app.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as ic;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  ic.init();
  runApp(const App());
}
