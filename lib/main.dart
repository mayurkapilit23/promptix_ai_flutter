import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promptix_ai_flutter/core/utils/app_routes.dart';
import 'package:promptix_ai_flutter/features/authentication/views/login_screen.dart';
import 'package:promptix_ai_flutter/features/gemini/views/home_screen.dart';
import 'package:promptix_ai_flutter/features/onboarding/views/splash_screen.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'features/onboarding/bloc/splash_bloc.dart';
import 'features/onboarding/bloc/splash_event.dart';

void main() {
  log('main method');
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<SplashBloc>(
          create: (_) => SplashBloc()..add(SplashStarted()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp(
      initialRoute: AppRoutes.splash,
      // theme: ThemeData(fontFamily: GoogleFonts.sourceCodePro().fontFamily),
      title: 'Promptix Ai',
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.splash: (context) => SplashScreen(),
        AppRoutes.login: (context) => LoginScreen(),
        AppRoutes.home: (context) => HomeScreen(),
      },
    );
  }
}
