import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flavordinamico/core/constants/global_variables.dart';
import 'package:flavordinamico/core/services/request_connections.dart';
import 'package:retry/retry.dart';


class DioClientImplementation implements RequestConnection{

  final _attempts = const RetryOptions(maxAttempts: 5);

  final Dio _dio = Dio(BaseOptions(
    connectTimeout: const Duration(milliseconds: 50000),
    receiveTimeout: const Duration(milliseconds: 30000),      
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    },
    followRedirects: true,
    receiveDataWhenStatusError: true,
    validateStatus: (status) {
      return status! <= 500;
    })
  ); 

  
  @override
  Future<HttpResponse> get({dataParameters, headerParameters, required String url}) async {

    if (GlobalVariables().token != "") {
      _dio.options.headers.addAll({HttpHeaders.authorizationHeader: 'Bearer ${GlobalVariables().token}',});
    }
    
    Response response = await _attempts.retry(
      () => _dio.get(url, queryParameters: dataParameters, options: Options(headers: headerParameters)),
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );
    return HttpResponse(data: response.data, statusCode: response.statusCode);
  }
  
  @override
  Future<HttpResponse> post({dataParameters, headerParameters, required String url, required data}) async {
    Response response = await _attempts.retry(
      () => _dio.post(url, queryParameters: dataParameters, data: data, options: Options(
          headers: headerParameters)),
        retryIf: (e) => e is SocketException || e is TimeoutException,
    );
    return HttpResponse(data: response.data, statusCode: response.statusCode);
  }
  
}