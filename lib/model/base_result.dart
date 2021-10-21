import 'package:toss/utils/api_request_status.dart';

class BaseResult<T> {
  APIRequestStatus status;
  String message;
  T data;

  BaseResult({required this.status, required this.message, required this.data});
}
