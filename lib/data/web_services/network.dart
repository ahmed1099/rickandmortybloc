import 'dart:io';
import 'package:bloc_demo/data/models/failure.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class Network {
  static const String baseUrl = "https://rickandmortyapi.com/api/";
  static final Dio _dio = Dio();

  /// GET Method
  static Future<Response<dynamic>> get(
    endPoint,
  ) async {
    Logger().d(
      baseUrl + endPoint,
    );
    try {
      Response response = await _dio.get(
        baseUrl + endPoint,
      );

      Logger().d(
        response.data,
      );

      return response;
    } on DioException catch (error) {
      Logger().d(
        error.response?.statusCode,
      );
      Logger().d(
        error.response?.statusMessage,
      );
      Logger().d(
        error.response?.data,
      );
      if (error.response?.statusCode == 401) {
        // make sure there is no 401 else

        throw Failure(
          message: "Session expired",
        );
      } else if (error.response!.statusCode == 500) {
        throw Failure(
          message: "Server error",
        );
      } else if (error.response!.statusCode == 404) {
        throw Failure(
          message: "Not Found",
        );
      } else {
        throw Failure(
          message: error.response!.statusMessage,
        );
      }
    } on SocketException {
      throw Failure(
        message: "No Internet connect",
      );
    } on FormatException {
      throw Failure(
        message: "Format Exception",
      );
    } on Error catch (e) {
      throw Failure(
        message: "Error $e",
      );
    }
  }
}
