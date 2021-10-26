import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:toss/model/base_result.dart';
import 'package:toss/model/session.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:toss/utils/api_request_status.dart';
import 'package:toss/utils/exception/ConnectionException.dart';

class SignInProvider extends ChangeNotifier {
  StreamController<BaseResult<String>> loginResult =
      StreamController<BaseResult<String>>();

  String id = "";
  String pw = "";

  void login() async {
    final request = {'id': id, 'password': pw};
    final storage = FlutterSecureStorage();

    Session.post('http://10.80.162.103:8000/user/login', request,
            isTokenRequired: false)
        .then((value) async {
      await storage.write(key: 'token', value: value['loginToken']);
      loginResult.add(BaseResult(
          status: APIRequestStatus.loaded,
          message: "성공적으로 로그인 하였습니다",
          data: value['loginToken']));
    }, onError: (e) {
      if (e is ConnectionException) {
        loginResult.add(BaseResult(
            status: APIRequestStatus.connectionError,
            data: "",
            message: e.message));
      } else {
        loginResult.add(BaseResult(
            status: APIRequestStatus.error, data: "", message: e.toString()));
      }
    });
  }
}
