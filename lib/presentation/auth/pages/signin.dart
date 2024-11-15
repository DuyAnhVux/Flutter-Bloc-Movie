import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/common/helper/navigation/app_navigation.dart';
import 'package:flutter_movie_app/core/configs/theme/app_colors.dart';
import 'package:flutter_movie_app/presentation/auth/pages/signup.dart';
import 'package:flutter_movie_app/presentation/home/pages/home.dart';
import 'package:reactive_button/reactive_button.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 100, left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signinText(),
            const SizedBox(
              height: 64,
            ),
            _emailTextField(),
            const SizedBox(
              height: 16,
            ),
            _passwordTextField(),
            const SizedBox(
              height: 32,
            ),
            _signinButton(context),
            const SizedBox(
              height: 16,
            ),
            _signupText(context)
          ],
        ),
      ),
    );
  }

  Widget _signinText() {
    return const Text(
      'Sign In',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _emailTextField() {
    return const TextField(
        decoration: InputDecoration(
      hintText: 'Email',
    ));
  }

  Widget _passwordTextField() {
    return const TextField(
        decoration: InputDecoration(
      hintText: 'Password',
    ));
  }

  Widget _signinButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign In',
      activeColor: AppColors.primary,
      onPressed: () async {},
      onSuccess: () {
        AppNavigator.pushAndRemove(context, const HomePage());
      },
      onFailure: (error) {
        // DisplayMessage.errorMessage(error, context);
      },
    );
  }

  Widget _signupText(BuildContext context) {
    return Text.rich(TextSpan(children: [
      const TextSpan(text: "Don't you have account?"),
      TextSpan(
          text: ' Sign Up',
          style: const TextStyle(color: Colors.blue),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigator.push(context, const SignupPage());
            })
    ]));
  }
}
