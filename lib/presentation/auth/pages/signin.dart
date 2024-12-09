import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/common/helper/message/display_message.dart';
import 'package:flutter_movie_app/common/helper/navigation/app_navigation.dart';
import 'package:flutter_movie_app/core/configs/theme/app_colors.dart';
import 'package:flutter_movie_app/data/auth/models/signin_req_params.dart';
import 'package:flutter_movie_app/domain/auth/usecases/signin.dart';
import 'package:flutter_movie_app/presentation/auth/pages/signup.dart';
import 'package:flutter_movie_app/presentation/home/pages/home.dart';
import 'package:flutter_movie_app/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
    return TextField(
        controller: _emailCtrl,
        decoration: const InputDecoration(
          hintText: 'Email',
        ));
  }

  Widget _passwordTextField() {
    return TextField(
        controller: _passwordCtrl,
        decoration: const InputDecoration(
          hintText: 'Password',
        ));
  }

  Widget _signinButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign In',
      activeColor: AppColors.primary,
      onPressed: () async => slGetIt<SigninUseCase>().call(
          params: SigninReqParams(
              email: _emailCtrl.text, password: _passwordCtrl.text)),
      onSuccess: () {
        AppNavigator.pushAndRemove(context, const HomePage());
      },
      onFailure: (error) {
        DisplayMessage.errorMessage(error, context);
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
              AppNavigator.push(context, SignupPage());
            })
    ]));
  }
}
