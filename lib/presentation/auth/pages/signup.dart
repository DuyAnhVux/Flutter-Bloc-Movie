import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/common/helper/message/display_message.dart';
import 'package:flutter_movie_app/common/helper/navigation/app_navigation.dart';
import 'package:flutter_movie_app/core/configs/theme/app_colors.dart';
import 'package:flutter_movie_app/data/auth/models/signup_req_params.dart';
import 'package:flutter_movie_app/domain/auth/usecases/signup.dart';
import 'package:flutter_movie_app/presentation/auth/pages/signin.dart';
import 'package:flutter_movie_app/presentation/home/pages/home.dart';
import 'package:flutter_movie_app/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final TextEditingController _passwordRetypeCtrl = TextEditingController();

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
              _signupText(),
              const SizedBox(
                height: 64,
              ),
              _emailTextField(),
              const SizedBox(
                height: 16,
              ),
              _passwordTextField(),
              const SizedBox(
                height: 16,
              ),
              _passwordRetypeTextField(),
              const SizedBox(
                height: 32,
              ),
              _signupButton(context),
              const SizedBox(
                height: 16,
              ),
              _signinText(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _signupText() {
    return const Text(
      'Sign Up',
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

  Widget _passwordRetypeTextField() {
    return TextField(
        controller: _passwordRetypeCtrl,
        decoration: const InputDecoration(
          hintText: 'Retype password',
        ));
  }

  Widget _signupButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign Up',
      activeColor: AppColors.primary,
      onPressed: () async => _passwordCtrl.text == _passwordRetypeCtrl.text
          ? slGetIt<SignupUseCase>().call(
              params: SignupReqParams(
                  email: _emailCtrl.text, password: _passwordCtrl.text))
          : null,
      onSuccess: () {
        AppNavigator.pushAndRemove(context, const HomePage());
      },
      onFailure: (error) {
        if (_passwordCtrl.text == _passwordRetypeCtrl.text) {
          DisplayMessage.errorMessage(error, context);
        } else {
          DisplayMessage.errorMessage(
              'Password and password retype are different!', context);
        }
      },
    );
  }

  Widget _signinText(BuildContext context) {
    return Text.rich(TextSpan(children: [
      const TextSpan(text: "Do you have account?"),
      TextSpan(
          text: ' Sign In',
          style: const TextStyle(color: Colors.blue),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigator.push(context, SigninPage());
            })
    ]));
  }
}
