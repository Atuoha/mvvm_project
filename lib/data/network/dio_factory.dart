// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_project/app/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = 'application/json';
const String CONTENT_TYPE = 'content-type';
const String ACCEPT = 'accept';
const String AUTHORIZATION = 'authorization';
const String DEFAULT_LANGUAGE = 'language';

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();

    int timeOut = 60 * 1000;
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: Constants.token,
      DEFAULT_LANGUAGE: "en"
    };
    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: timeOut,
      receiveTimeout: timeOut,
      headers: headers,
    );

    if (kReleaseMode) {
      if (kDebugMode) {
        print("Release mode no logs");
      }
    } else {
      dio.interceptors.add(PrettyDioLogger(request: true,
        requestBody: true,
        requestHeader: true,
        responseHeader: true,),);
    }

    return dio;
  }
}
