import 'package:flutter/cupertino.dart';
import 'package:toss/utils/api_request_status.dart';

class HomeProvider extends ChangeNotifier {
  APIRequestStatus apiRequestStatus = APIRequestStatus.unInitialized;

  getContents() async {
    setApiRequestStatus(APIRequestStatus.loading);
    setApiRequestStatus(APIRequestStatus.loaded);
  }

  void setApiRequestStatus(APIRequestStatus status) {
    apiRequestStatus = status;
    notifyListeners();
  }
}
