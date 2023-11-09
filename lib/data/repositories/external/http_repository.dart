import 'package:micro_app/domain/models/http_response_model.dart';

abstract class HttpRepository {
  Future<HttpResponseModel> get<T>(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    dynamic data,
  });
  Future<HttpResponseModel> post<T>(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    dynamic data,
  });
  Future<HttpResponseModel> put<T>(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    dynamic data,
  });
  Future<HttpResponseModel> delete<T>(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    dynamic data,
  });
}
