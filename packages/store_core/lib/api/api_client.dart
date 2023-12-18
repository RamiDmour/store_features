import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import 'api_params/index.dart';
import 'interceptors/index.dart';
export 'api_params/index.dart';
export 'interceptors/index.dart';

class ApiClient {
  late final Dio _dio;

  ApiClient.fromDio(
    Dio dio, {
    List<Interceptor>? interceptors,
  }) {
    _dio = dio;
    _dio.interceptors.addAll(
      interceptors ??
          [
            HeadersInterceptor(),
            ErrorsInterceptor(),
          ],
    );
  }

  ApiClient.fromApiUrl(
    String apiUrl, {
    List<Interceptor>? interceptors,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: apiUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
        receiveDataWhenStatusError: true,
        followRedirects: true,
      ),
    );
    _dio.interceptors.addAll(
      interceptors ??
          [
            HeadersInterceptor(),
            ErrorsInterceptor(),
          ],
    );
  }

  Future<ApiResult<T>> executeRequest<T>({
    required ApiRequest request,
  }) async {
    try {
      final response = switch (request.method) {
        RequestMethod.GET => await _dio.get<T>(
            request.path,
            queryParameters: request.query,
            onReceiveProgress: request.onReceiveCallback,
          ),
        RequestMethod.POST => await _dio.post<T>(
            request.path,
            data: request.data,
            queryParameters: request.query,
            onSendProgress: request.onSendCallback,
            onReceiveProgress: request.onReceiveCallback,
          ),
        RequestMethod.PUT => await _dio.put<T>(
            request.path,
            data: request.data,
            queryParameters: request.query,
            onSendProgress: request.onSendCallback,
            onReceiveProgress: request.onReceiveCallback,
          ),
        RequestMethod.PATCH => await _dio.patch<T>(
            request.path,
            data: request.data,
            queryParameters: request.query,
            onSendProgress: request.onSendCallback,
            onReceiveProgress: request.onReceiveCallback,
          ),
        RequestMethod.DELETE => await _dio.delete<T>(
            request.path,
            data: request.data,
            queryParameters: request.query,
          ),
      };
      return ApiResult.success(data: response.data);
    } on DioException catch (e) {
      return ApiResult.failure(exception: e);
    } catch (e) {
      return ApiResult.failure(
          exception: DioException(requestOptions: RequestOptions()));
    }
  }

  Future<ApiResult<Uint8List>> apiDownload<T>({
    required String url,
    Map<String, dynamic>? parameters,
  }) async {
    try {
      Options customOptions = Options(
        responseType: ResponseType.bytes,
        followRedirects: false,
        receiveTimeout: const Duration(seconds: 60),
      );

      final response = await _dio.get<Uint8List>(
        url,
        queryParameters: parameters,
        options: customOptions,
      );
      return ApiResult.success(data: response.data);
    } on DioException catch (e) {
      return ApiResult.failure(exception: e);
    }
  }
}
