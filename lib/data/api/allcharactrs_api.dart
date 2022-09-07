import 'package:dio/dio.dart';
import 'package:flutter_application_bloc/consts/strings.dart';

class AllChractrsapi {
  late Dio dio;
  AllChractrsapi() {
    BaseOptions option = BaseOptions(
      baseUrl: url,
      receiveDataWhenStatusError: true,
      receiveTimeout: 20 * 1000,
      connectTimeout: 20 * 1000,
    );
    dio = Dio(option);
  }
  Future<List<dynamic>> getallchracapi() async {
    try {
      Response response = await dio.get("characters");
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getallquote(String charname) async {
    try {
      Response response =
          await dio.get("quote", queryParameters: {'author': charname});
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
