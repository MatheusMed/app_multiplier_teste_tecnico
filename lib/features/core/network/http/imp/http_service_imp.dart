import 'package:app_multiplier_teste_tecnico/features/core/network/http/i_http_service.dart';
import 'package:app_multiplier_teste_tecnico/features/core/network/http/response/http_response_mapper.dart';
import 'package:app_multiplier_teste_tecnico/features/core/network/http/response/http_response_return.dart';
import 'package:dio/dio.dart';

class HttpServiceImp implements IHttpService {
  final Dio _dio;

  HttpServiceImp(this._dio);

  @override
  Future<HttpResponseReturn<T>> get<T>({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return HttpResponseMapper.success<T>(response);
    } on DioException catch (e) {
      return HttpResponseMapper.dioError<T>(e);
    } catch (e) {
      return HttpResponseMapper.unknownError<T>(e);
    }
  }
}
