import 'package:dio/dio.dart';
import 'package:meem/core/api/api_consumer.dart';
import 'dart:async';

import 'package:meem/core/api/endpoint.dart';


class DioConsumer implements ApiConsumer {
  final Dio dio;
  DioConsumer({required this.dio, String? token}) {
    dio.options.baseUrl = Endpoints.baseUrl;
    if (token != null) {
      dio.options.headers = {
        'Authorization': 'Bearer $token',
      };
    }
    dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        request: true,
        error: true,
        requestBody: true,
      ),
    );
  }

  @override
  Future delete(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data}) async {
    Response response = await dio.delete(endPoint,
        queryParameters: queryParameters, data: data);
    return response.data;
  }

  @override
  Future get(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data}) async {
    Response response =
        await dio.get(endPoint, queryParameters: queryParameters, data: data);
    return response.data;
  }

  @override
  Future patch(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data,
      bool isFormData = false}) async {
    Response response = await dio.patch(endPoint,
        queryParameters: queryParameters,
        data: isFormData ? FormData.fromMap(data!) : data);
    return response.data;
  }

  @override
  Future post(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data,
      bool isFormData = false}) async {
    Response response = await dio.post(endPoint,
        queryParameters: queryParameters,
        data: isFormData ? FormData.fromMap(data!) : data);
    return response.data;
  }

  @override
  Future put(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data,
      bool isFormData = false}) async {
    Response response = await dio.put(endPoint,
        queryParameters: queryParameters,
        data: isFormData ? FormData.fromMap(data!) : data);
    return response.data;
  }
}
