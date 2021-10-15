import 'package:dio/dio.dart';

class Http<T> {
  static const String BASE_URL = '';
  Future<T> getHttp(query) async {
    try {
      var response = await Dio().get(BASE_URL + query);
      print(response);
      return response.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  void postHttp(String query, parameters) async {
    try {
      var response = await Dio().post(BASE_URL + query, data: parameters);
      print(response);
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
