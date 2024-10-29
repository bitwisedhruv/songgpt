import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songgpt/features/auth/controller/auth_controller.dart';
import 'package:songgpt/features/auth/screens/signup_screen.dart';

class LogoutButton extends ConsumerWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        ref.read(authControllerProvider).logout();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const SignupScreen(),
          ),
          (route) => false,
        );
      },
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(395, 55),
        backgroundColor: Theme.of(context)
            .colorScheme
            .primary, // Adapt to theme's primary color
      ),
      child: Text(
        'Log out',
        style: TextStyle(
          fontSize: 17,
          color: Theme.of(context)
              .colorScheme
              .onPrimary, // Text color based on theme
        ),
      ),
    );
  }
}
