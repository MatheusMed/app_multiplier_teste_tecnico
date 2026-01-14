class HttpResponseReturn<T> {
  final T? data;
  final int statusCode;
  final Map<String, dynamic>? headers;
  final String? message;
  final bool success;

  HttpResponseReturn({
    this.data,
    required this.statusCode,
    this.headers,
    this.message,
    required this.success,
  });

  @override
  String toString() {
    return 'HttpResponse(success: $success, statusCode: $statusCode, message: $message, data: $data)';
  }
}
