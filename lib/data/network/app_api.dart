import 'package:retrofit/http.dart';
import '../../app/constants.dart';
import 'package:dio/dio.dart';

import '../responses/responses.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/customers/login")
  Future<AuthenticateResponse> login(
    @Field('email') String email,
    @Field('password') String password,
    @Field('imei') String imei,
    @Field('deviceType') String deviceType,
  );
}
