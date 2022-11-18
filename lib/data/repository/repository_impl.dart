import 'package:dartz/dartz.dart';
import 'package:mvvm_project/data/mapper/mapper.dart';
import 'package:mvvm_project/data/network/failure.dart';
import 'package:mvvm_project/data/requests/requests.dart';
import 'package:mvvm_project/domain/models/authentication.dart';
import 'package:mvvm_project/domain/repository.dart';

import '../data_source/remote_data_source.dart';
import '../network/network_info.dart';

class RespositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RespositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // good connection
      final response = await _remoteDataSource.login(loginRequest);
      if (response.status == 0) {
        // authenticate return Right- Authentication
        return Right(response.toDomain());
      } else {
        // error return Left- Failure
        return Left(Failure(409, response.message ?? "There is an error from API!"));
      }
    } else {
      // connection error
      return Left(Failure(501,"Opps! Check your internet connection!"));
    }

  }
}
