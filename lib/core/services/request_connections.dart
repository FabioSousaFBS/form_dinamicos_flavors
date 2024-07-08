abstract class RequestConnection{

  Future<HttpResponse> get({dynamic dataParameters, dynamic headerParameters, required String url});

  Future<HttpResponse> post({dynamic dataParameters, dynamic headerParameters, required String url, required dynamic data});

}

class HttpResponse{

  final dynamic data;
  final int? statusCode;

  HttpResponse({required this.data, required this.statusCode});
  
}