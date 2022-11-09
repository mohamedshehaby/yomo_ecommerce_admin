import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/dependency_injection.dart';
import 'firebase_options.dart';

void main() async {
  // Ensure that Flutter engine already started and binding is ok
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  initAppModule();

  runApp(MyApp());
}
