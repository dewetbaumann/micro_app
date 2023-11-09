import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:micro_app/data/repositories/external/http_repository.dart';
import 'package:micro_app/domain/models/http_response_model.dart';
import 'package:print_map/print_map.dart';

class HttpImplementation implements HttpRepository {
  final _http = Dio();

  @override
  Future<HttpResponseModel> get<T>(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    dynamic data,
  }) async {
    final logger = Logger();

    try {
      printMap({'GET': url, 'header': headers, 'params': params, 'data': data});

      final response = await _http.get<T?>(
        Uri.parse(url).toString(),
        options: Options(headers: headers),
        queryParameters: params,
      );

      printMap({'From': url, 'Status': response.statusCode, 'Response': response.data});
      return HttpResponseModel(code: response.statusCode!, data: response.data);
    } catch (e) {
      logger.e(e);
      if (e is DioException) {
        if (e.error.runtimeType == SocketException) {
          Logger().e('No connection with: $url');
          return const HttpResponseModel(code: 0, data: null);
        }
      }
      rethrow;
    }
  }

  @override
  Future<HttpResponseModel> post<T>(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    dynamic data,
  }) async {
    final logger = Logger();

    try {
      printMap({'POST': url, 'header': headers, 'params': params, 'data': data});

      final response = await _http.post<T?>(
        Uri.parse(url).toString(),
        data: data,
        queryParameters: params,
        options: Options(headers: headers),
      );

      printMap({'From': url, 'Status': response.statusCode, 'Response': response.data});
      return HttpResponseModel(code: response.statusCode!, data: response.data);
    } catch (e) {
      logger.e(e);
      if (e is DioException) {
        if (e.error.runtimeType == SocketException) {
          Logger().e('No connection with: $url');
          return const HttpResponseModel(code: 0, data: null);
        }
      }
      rethrow;
    }
  }

  @override
  Future<HttpResponseModel> put<T>(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    dynamic data,
  }) async {
    final logger = Logger();

    try {
      printMap({'PUT': url, 'header': headers, 'params': params, 'data': data});

      final response = await _http.put<T?>(
        Uri.parse(url).toString(),
        data: data,
        options: Options(headers: headers),
        queryParameters: params,
      );
      printMap({'From': url, 'Status': response.statusCode, 'Response': response.data});
      return HttpResponseModel(code: response.statusCode!, data: response.data);
    } catch (e) {
      logger.e(e);
      if (e is DioException) {
        if (e.error.runtimeType == SocketException) {
          Logger().e('No connection with: $url');
          return const HttpResponseModel(code: 0, data: null);
        }
      }
      rethrow;
    }
  }

  @override
  Future<HttpResponseModel> delete<T>(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    dynamic data,
  }) {
    printMap({'DELETE': url, 'header': headers, 'params': params, 'data': data});
    throw UnimplementedError();
    // printMap({'From': url,'Status': response.statusCode,'Response': responsedata, });
  }
}
