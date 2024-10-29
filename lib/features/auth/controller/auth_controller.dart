import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songgpt/features/auth/repository/auth_repository.dart';

final authControllerProvider = Provider(
  (ref) => AuthController(
    authRepository: ref.read(
      authRepositoryProvider,
    ),
  ),
);

final authStateProvider = StreamProvider(
  (ref) => ref.watch(authRepositoryProvider).authState,
);

final class AuthController {
  final AuthRepository _authRepository;

  AuthController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  void signUpWithEmail({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    await _authRepository.signUpWithEmail(
      name: name,
      email: email,
      password: password,
      context: context,
    );
  }

  void signInWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    await _authRepository.signInWithEmail(
      email: email,
      password: password,
      context: context,
    );
  }

  void signInWithGoogle(BuildContext context) async {
    await _authRepository.signInWithGoogle(context);
  }

  void logout() {
    _authRepository.logout();
  }
}
