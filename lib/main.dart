import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songgpt/core/theme/theme.dart';
import 'package:songgpt/core/theme/theme_provider.dart';
import 'package:songgpt/core/utils/error_screen.dart';
import 'package:songgpt/core/utils/loader.dart';
import 'package:songgpt/features/auth/controller/auth_controller.dart';
import 'package:songgpt/features/auth/screens/signup_screen.dart';
import 'package:songgpt/features/home/screens/home_page.dart';

import 'package:songgpt/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider);
    final authState = ref.watch(authStateProvider);
    return MaterialApp(
      theme: AppTheme.lightModeAppTheme,
      darkTheme: AppTheme.darkModeAppTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: authState.when(
        data: (user) => user != null ? const HomePage() : const SignupScreen(),
        error: (error, stackTrace) => ErrorScreen(
          text: error.toString(),
        ),
        loading: () => const Loader(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
