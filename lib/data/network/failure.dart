import 'error_handler.dart';

class Failure {
  int statusCode;
  String message;

  Failure(this.statusCode, this.message);
}

class DefaultFailure extends Failure {
  DefaultFailure() : super(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
}
