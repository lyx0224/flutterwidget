import 'package:dio/dio.dart';

class SimpleHttpManager {
  static const int connectTimeOut = 30 * 1000;
  static const int recvTimeOut = 30 * 1000;

  static const String GET = 'get';
  static const String POST = 'post';

  static final SimpleHttpManager _instance = SimpleHttpManager._internal();
  Dio _client;

  factory SimpleHttpManager() => _instance;

  SimpleHttpManager._internal() {
    if (_client == null) {
      BaseOptions options = BaseOptions(
          connectTimeout: connectTimeOut, receiveTimeout: recvTimeOut);
      _client = Dio(options);
    }
  }

  Future<Response<dynamic>> get(
      {String path, Map<String, dynamic> paramters}) async {
    return _client.get(path, queryParameters: paramters);
  }
}
