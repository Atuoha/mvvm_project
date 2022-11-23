// ignore_for_file: avoid_print
import 'dart:async';
import 'package:mvvm_project/domain/usecase/login_usecase.dart';
import 'package:mvvm_project/presentation/base/baseview.dart';
import 'package:mvvm_project/presentation/common/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController _usernameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  final StreamController _isAllInputsValidController =
      StreamController<void>.broadcast();

  var loginObject = LoginObject("", "");
  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);

  @override
  void dispose() {
    _usernameStreamController.close();
    _isAllInputsValidController.close();
    _passwordStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  //Inputs
  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUsername => _usernameStreamController.sink;

  @override
  // TODO: implement inputIsAllValid
  Sink get inputIsAllValid => _isAllInputsValidController.sink;

  @override
  login() async {
    (await _loginUseCase.execute(
      LoginUseCaseInput(
        loginObject.username,
        loginObject.password,
      ),
    ))
        .fold(
            (failure) => {
                  // left (failure)
                  print(failure.message)
                },
            (data) => {
                  // right (authentication data -success)
                  print(data.customer?.name)
                });
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    _validate();
  }

  @override
  setUserName(String username) {
    inputUsername.add(username);
    loginObject = loginObject.copyWith(username: username);
    _validate();
  }

  //Outputs
  @override
  Stream<bool> get outputIsPasswordValid =>
      _passwordStreamController.stream.map(
        (password) => validatePassword(password),
      );

  @override
  Stream<bool> get outputIsUserNameValid =>
      _usernameStreamController.stream.map(
        (username) => validateUsername(username),
      );

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidController.stream.map((_) => _isAllInputsValid());

  // functions
  _validate() {
    _isAllInputsValidController.add(null);
  }

  bool validatePassword(String password) {
    return password.isNotEmpty;
  }

  bool validateUsername(String username) {
    return username.isNotEmpty;
  }

  bool _isAllInputsValid() {
    return validatePassword(loginObject.password) &&
        validateUsername(loginObject.username);
  }
}

abstract class LoginViewModelInputs {
  // functions
  setUserName(String username);

  setPassword(String password);

  login();

  // sinks
  Sink get inputUsername;

  Sink get inputPassword;

  Sink get inputIsAllValid;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsUserNameValid;

  Stream<bool> get outputIsAllInputsValid;

  Stream<bool> get outputIsPasswordValid;
}
