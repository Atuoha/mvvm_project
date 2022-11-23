import 'package:flutter/material.dart';
import 'package:mvvm_project/presentation/authentication/login/login_viewmodel.dart';
import 'package:mvvm_project/presentation/resources/values_manager.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/string_manager.dart';
import '../../resources/styles_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel _loginViewModel = LoginViewModel(null);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bind() {
    _loginViewModel.start();
    _usernameController.addListener(
      () => _loginViewModel.setUserName(_usernameController.text),
    );
    _passwordController.addListener(
      () => _loginViewModel.setPassword(_passwordController.text),
    );
  }

  @override
  void initState() {
    super.initState();
    bind();
  }

  login() {
    _loginViewModel.login();
  }

  navigateToForgotPass() {}

  navigateToSignUp() {}

  @override
  void dispose() {
    super.dispose();
    _loginViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          top: AppPadding.p100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(ImageAsset.splashImage),
            Text(
              AppString.appName,
              style: getBoldStyle(
                color: ColorManager.primaryColor,
                fontSize: FontSize.s18,
              ),
            ),
            const SizedBox(height: AppSize.s12),
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    StreamBuilder<bool>(
                      stream: _loginViewModel.outputIsUserNameValid,
                      builder: (context, snapshot) => TextFormField(
                        controller: _usernameController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Enter Username',
                          labelText: 'Username',
                          errorText: (snapshot.data ?? true)
                              ? null
                              : 'Username has error',
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    StreamBuilder<bool>(
                      stream: _loginViewModel.outputIsPasswordValid,
                      builder: (context, snapshot) => TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: 'Enter Password',
                          labelText: 'Password',
                          errorText: (snapshot.data ?? true)
                              ? null
                              : 'Password has error',
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSize.s28),
                    StreamBuilder<bool>(
                      stream: _loginViewModel.outputIsAllInputsValid,
                      builder: (context, snapshot) => ElevatedButton(
                        onPressed:
                            (snapshot.data ?? false) ?  () => login : null ,
                        child: const Text('Login'),
                      ),
                    ),
                    const SizedBox(height: AppSize.s16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => navigateToForgotPass(),
                          child: const Text(
                            'Forgot Password',
                          ),
                        ),
                        TextButton(
                          onPressed: () => navigateToSignUp(),
                          child: const Text(
                            'Not a member? Signup',
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
