import 'package:dio/dio.dart';

import 'http_response_return.dart';

class HttpResponseMapper {
  static HttpResponseReturn<T> success<T>(Response response) {
    return HttpResponseReturn<T>(
      data: response.data,
      statusCode: response.statusCode ?? 0,
      headers: response.headers.map,
      success: true,
    );
  }

  static HttpResponseReturn<T> dioError<T>(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return HttpResponseReturn<T>(
        data: null,
        statusCode: 408,
        message: 'Tempo limite excedido',
        success: false,
      );
    }

    return HttpResponseReturn<T>(
      data: null,
      statusCode: e.response?.statusCode ?? 500,
      headers: e.response?.headers.map,
      message: e.response?.data?.toString() ?? e.message,
      success: false,
    );
  }

  static HttpResponseReturn<T> unknownError<T>(Object e) {
    return HttpResponseReturn<T>(
      data: null,
      statusCode: 500,
      message: e.toString(),
      success: false,
    );
  }
}
