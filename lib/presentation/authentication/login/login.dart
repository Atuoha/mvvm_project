import 'package:flutter/material.dart';
import 'package:mvvm_project/presentation/authentication/login/login_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel _loginViewModel = LoginViewModel(null);
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

  @override
  void dispose() {
    super.dispose();
    _loginViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
