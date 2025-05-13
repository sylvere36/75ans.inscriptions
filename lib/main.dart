import 'package:madeb75/src/infrastructure/_commons/network/env_config.dart';
import 'package:madeb75/src/presentation/app.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as ic;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EnvManager().init(env: Environment.dev);
  ic.init();
  runApp(const App());
}
