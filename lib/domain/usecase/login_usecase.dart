import 'package:dartz/dartz.dart';
import 'package:mvvm_project/app/functions.dart';
import 'package:mvvm_project/data/network/failure.dart';
import 'package:mvvm_project/data/requests/requests.dart';
import 'package:mvvm_project/domain/models/authentication.dart';
import 'package:mvvm_project/domain/models/device_info.dart';
import 'package:mvvm_project/domain/repository/repository.dart';
import 'package:mvvm_project/domain/usecase/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  final Repository _repository;
  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    DeviceInfo deviceInfo = await getDeviceInfo();
    return await _repository.login(
      LoginRequest(
        input.email,
        input.password,
        deviceInfo.identifier,
        deviceInfo.name,
      ),
    );
  }
}

class LoginUseCaseInput {
  final String email;
  final String password;

  LoginUseCaseInput(this.email, this.password);
}
