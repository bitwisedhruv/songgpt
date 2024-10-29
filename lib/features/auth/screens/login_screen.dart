import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songgpt/features/auth/controller/auth_controller.dart';
import 'package:songgpt/features/auth/screens/signup_screen.dart';
import 'package:songgpt/features/auth/widgets/auth_button.dart';
import 'package:songgpt/features/auth/widgets/auth_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Login.",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthField(
                    hintText: 'Email',
                    controller: emailController,
                    inputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AuthField(
                    hintText: 'Password',
                    controller: passwordController,
                    isObscure: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthButton(
                    buttonText: 'Log In',
                    onPressed: () {
                      ref.read(authControllerProvider).signInWithEmail(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                            context: context,
                          );
                      debugPrint('user logged in');
                    },
                    height: 55,
                    width: 395,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style: Theme.of(context).textTheme.titleMedium,
                        children: [
                          TextSpan(
                            text: 'Signup',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue,
                                ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  AuthButton(
                    buttonText: 'Sign in with Google',
                    onPressed: () {
                      ref
                          .read(authControllerProvider)
                          .signInWithGoogle(context);
                    },
                    height: 13.75,
                    width: 210,
                    imgSrc:
                        'https://fonts.gstatic.com/s/i/productlogos/googleg/v6/24px.svg',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
