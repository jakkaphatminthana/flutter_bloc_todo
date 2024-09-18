import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_todo/core/constants/provider_constant.dart';

class NetworkUtils {
  final Dio _dio;

  const NetworkUtils._(this._dio);

  factory NetworkUtils({
    required Dio dio,
  }) {
    return NetworkUtils._(dio);
  }

  ///GET
  Future<Map<String, dynamic>> get({
    required String path,
    Map<String, dynamic>? queryParams,
  }) async =>
      await _remoteRequest(path, 'GET', null, queryParams);

  ///POST
  Future<Map<String, dynamic>> post({
    required String path,
    Map<String, dynamic>? data,
  }) async =>
      await _remoteRequest(path, 'POST', data, null);

  ///PUT
  Future<Map<String, dynamic>> put({
    required String path,
    Map<String, dynamic>? data,
  }) async =>
      await _remoteRequest(path, 'PUT', data, null);

  ///DELETE
  Future<Map<String, dynamic>> delete({
    required String path,
    Map<String, dynamic>? data,
  }) async =>
      await _remoteRequest(path, 'DELETE', data, null);

  /// Base remote request
  Future<Map<String, dynamic>> _remoteRequest<T>(
    String path,
    String method,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  ) async {
    if (path.isEmpty) {
      throw Exception('Invalid path');
    }

    const String serverEndpoint = ProviderConstant.baseEndpoint;
    if (path.startsWith('/')) path = path.replaceFirst('/', '');
    final String fullUrl = serverEndpoint + path;

    try {
      final Response response = await _dio.request(
        fullUrl,
        options: Options(method: method),
        data: data,
        queryParameters: queryParameters,
      );
      final Map<String, dynamic> result = _mapRemoteResponse(response);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  static Map<String, dynamic> _mapRemoteResponse<T>(Response response) {
    final body = response.data;
    if (body == null) {
      throw Exception("No response data");
    }
    return body;
  }
}
