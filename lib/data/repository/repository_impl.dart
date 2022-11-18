import 'package:dartz/dartz.dart';
import 'package:mvvm_project/data/mapper/mapper.dart';
import 'package:mvvm_project/data/network/failure.dart';
import 'package:mvvm_project/data/requests/requests.dart';
import 'package:mvvm_project/domain/models/authentication.dart';
import 'package:mvvm_project/domain/repository/repository.dart';

import '../data_source/remote_data_source.dart';
import '../network/error_handler.dart';
import '../network/network_info.dart';

class RespositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RespositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        // good connection
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.SUCCESS) {
          // authenticate return Right- Authentication
          return Right(response.toDomain());
        } else {
          // error return Left- Failure
          return Left(
            Failure(
              response.status ?? ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
