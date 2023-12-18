import 'package:dio/dio.dart' show DioException;
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

enum ApiResultStatus { success, failure }

final class ApiResult<T> extends Equatable {
  final ApiResultStatus status;
  final T? data;
  final DioException? exception;

  const ApiResult({
    required this.status,
    this.data,
    this.exception,
  });

  @override
  List<Object?> get props => [status, data, exception];

  factory ApiResult.success({required T? data}) =>
      ApiResult(data: data, status: ApiResultStatus.success);
  factory ApiResult.failure({required DioException? exception}) =>
      ApiResult(exception: exception, status: ApiResultStatus.failure);
}

final class ApiResultParser {
  static Future<K> parse<T, K>(T data, K Function(T) mapper) => compute<T, K>(mapper, data);
}
