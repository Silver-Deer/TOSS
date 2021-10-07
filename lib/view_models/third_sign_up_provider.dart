import 'package:flutter/material.dart';

class ThirdSignUpProvider extends ChangeNotifier {
  String _simplePw = "";
  String get simplePw => _simplePw;
  String _confirmSimplePw = "";
  String get confirmSimplePw => _confirmSimplePw;
  bool _isTargetConfirm = false;
  bool get isTargetConfirm => _isTargetConfirm;

  String errorMessage = "";

  void addOneSimplePw(int num) {
    if (num == -1 && simplePw.length > 0) {
      _simplePw = _simplePw.substring(0, _simplePw.length - 1);
    } else if (num != -1 && simplePw.length < 6) {
      _simplePw = "$_simplePw$num";
      if (_simplePw.length == 6) setTarget(true);
    }
    notifyListeners();
  }

  void addOneSimpleConfirmPw(int num) {
    if (num == -1 && confirmSimplePw.length > 0) {
      _confirmSimplePw =
          _confirmSimplePw.substring(0, _confirmSimplePw.length - 1);
    } else if (num != -1 && confirmSimplePw.length < 6) {
      _confirmSimplePw = "$_confirmSimplePw$num";
      if (completeThirdPage()) {}
    }
    notifyListeners();
  }

  void setTarget(bool isConfirm) {
    if (isConfirm == false) {
      _simplePw = "";
      _confirmSimplePw = "";
      _isTargetConfirm = isConfirm;
    } else {
      _isTargetConfirm = isConfirm;
    }
    notifyListeners();
  }

  bool completeThirdPage() {
    return simplePw == confirmSimplePw;
  }
}
