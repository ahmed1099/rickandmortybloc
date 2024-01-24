import 'package:bloc_demo/data/models/failure.dart';
import 'package:bloc_demo/data/web_services/network.dart';
import 'package:dio/dio.dart';

class SharedRepo {
  Future getAllCharacters() async {
    try {
      Response response = await Network.get(
        "character",
      );
      return response.data;
    } on Failure {
      rethrow;
    }
  }
}
