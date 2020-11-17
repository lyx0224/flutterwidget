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

  get error => _error;

  get data => _data;
}
