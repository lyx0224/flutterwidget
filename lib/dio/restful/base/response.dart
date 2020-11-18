import 'package:myflutterwiget/dio/restful/base/error.dart';

class BaseModel<T> {
  ServerError _error;
  T _data;

  setError(ServerError error) {
    _error = error;
  }

  setData(T data) {
    _data = data;
  }

  ServerError get error => _error;

  T get data => _data;
}
