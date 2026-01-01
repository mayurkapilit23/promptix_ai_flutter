import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promptix_ai_flutter/app_root.dart';
import 'package:promptix_ai_flutter/features/authentication/bloc/auth_bloc.dart';
import 'package:promptix_ai_flutter/features/authentication/bloc/auth_event.dart';
import 'package:promptix_ai_flutter/features/authentication/data/repositories/auth_repo.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'firebase_options.dart';

void main() async {
  log('main method');
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      final authRepo = AuthRepo();

      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(create: (_) => AuthBloc(authRepo)..add(AppStarted())),
          ],
          child: const MyApp(),
        ),
      );
    },
    (error, stack) {
      debugPrint('Uncaught error by runZonedGuarded: $error\n$stack');
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp(
      title: 'Promptix Ai',
      debugShowCheckedModeBanner: false,
      home: AppRoot(),
    );
  }
}
