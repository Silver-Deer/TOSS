import 'package:flutter/cupertino.dart';
import 'package:toss/model/domain/account.dart';
import 'package:toss/model/session.dart';
import 'package:toss/utils/api_request_status.dart';

class HomeProvider extends ChangeNotifier {
  APIRequestStatus networkStatus = APIRequestStatus.unInitialized;
  List<Account> _accountList = [];
  List<Account> get accountList => _accountList;

  getContents() async {
    setApiRequestStatus(APIRequestStatus.loading);
    getMyAccounts();
  }

  void setApiRequestStatus(APIRequestStatus status) {
    networkStatus = status;
    notifyListeners();
  }

  void getMyAccounts() {
    Session.get('http://10.80.162.103:8000/account').then((value) {
      _accountList = new List<Map<String, dynamic>>.from(value['data'])
          .map((json) => Account.fromJson(json))
          .toList();
      setApiRequestStatus(APIRequestStatus.loaded);
    }, onError: (e) {
      setApiRequestStatus(APIRequestStatus.error);
    });
  }
}
