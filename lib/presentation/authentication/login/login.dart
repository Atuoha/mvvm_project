import 'package:flutter/material.dart';
import 'package:mvvm_project/presentation/authentication/login/login_viewmodel.dart';
import 'package:mvvm_project/presentation/resources/values_manager.dart';
import '../../../app/di.dart';
import '../../common/state_renderer/state_renderer_impl.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/route_manager.dart';
import '../../resources/string_manager.dart';
import '../../resources/styles_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel _loginViewModel = instance<LoginViewModel>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var passwordObscure = true;

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
    FocusScope.of(context).unfocus();
    _loginViewModel.login();
  }

  navigateToForgotPass() {
    Navigator.of(context).pushNamed(RouteManager.forgotPasswordRoute);
  }

  navigateToSignUp() {
    Navigator.of(context).pushNamed(RouteManager.registerRoute);
  }

  @override
  void dispose() {
    super.dispose();
    _loginViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<FlowState>(
        stream: _loginViewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(
                context,
                _getContentWidget(),
                () {
                  _loginViewModel.login();
                },
              ) ??
              _getContentWidget();
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppPadding.p100,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(ImageAsset.splashImage),
            Text(
              '${AppString.appName} Sign in',
              style: getBoldStyle(
                color: ColorManager.primaryColor,
                fontSize: FontSize.s18,
              ),
            ),
            const SizedBox(height: AppSize.s12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p28),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    StreamBuilder<bool>(
                      stream: _loginViewModel.outputIsUserNameValid,
                      builder: (context, snapshot) => TextFormField(
                        controller: _usernameController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
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
                        obscureText: passwordObscure,
                        decoration: InputDecoration(
                          suffixIcon: _passwordController.text.isNotEmpty
                              ? IconButton(
                                  onPressed: () => setState(() {
                                    passwordObscure = !passwordObscure;
                                  }),
                                  icon: Icon(
                                    passwordObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                )
                              : const SizedBox.shrink(),
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
                            (snapshot.data ?? false) ? () => login() : null,
                        child: const Text('Login'),
                      ),
                    ),
                    const SizedBox(height: AppSize.s12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => navigateToForgotPass(),
                          child: Text(
                            'Forgot Password',
                            style: getRegularStyle(
                              color: ColorManager.primaryColor,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => navigateToSignUp(),
                          child: Text(
                            'Not a member? Signup',
                            style: getRegularStyle(
                              color: ColorManager.primaryColor,
                            ),
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
