import 'package:dartz/dartz.dart';
import '../data/network/failure.dart';
import 'models/authentication.dart';
import '../data/requests/requests.dart';

abstract class Repository{
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest );
}