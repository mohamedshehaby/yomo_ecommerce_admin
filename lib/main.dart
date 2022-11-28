import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yomo_ecommerce/presentation/blocs/simple_bloc_oberserver.dart';

import 'app/app.dart';
import 'app/dependency_injection.dart';
import 'firebase_options.dart';

void main() async {
  // Ensure that Flutter engine already started and binding is ok
  WidgetsFlutterBinding.ensureInitialized();

  // Ensure that firebase is initialized
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // For Adding Dependencies
  initAppModule();

  // Observe all Blocs
  Bloc.observer = SimpleBlocObserver();

  runApp(MyApp());
}
