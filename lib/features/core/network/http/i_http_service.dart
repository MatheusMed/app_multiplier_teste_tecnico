import 'response/http_response_return.dart';

abstract interface class IHttpService {
  Future<HttpResponseReturn<T>> get<T>({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
}
