import 'package:flutter/material.dart';

class SecondSignUpProvider extends ChangeNotifier {
  String _nickname = "";
  String get nickname => _nickname;
  String _image = "";
  String get image => _image;
  bool _isSvg = false;
  bool get isSvg => _isSvg;
  bool isNicknamePass = false;

  String errorMessage = "";

  static final RegExp regExp = RegExp('[^a-z|^A-Z|^0-9]');
  static final RegExp enRegExp = RegExp('[a-z|A-Z]');
  static final RegExp numRegExp = RegExp('[0-9]');
  static final RegExp specialExp = RegExp(r'[\.!@#<>?":_`~;[\]\\|=+)(*&^%-]');
  static final RegExp notNumRegExp = RegExp('[^0-9]');
  static final RegExp koreanRegExp = RegExp(r'[\uac00-\ud7af|a-z|A-Z|\s]');

  void setNickname(String nickname) {
    if (specialExp.hasMatch(nickname) || numRegExp.hasMatch(nickname)) {
      notifyListeners();
      return;
    }
    _nickname = nickname;
  }

  bool checkNickname(String nickname) {
    if (specialExp.hasMatch(nickname)) {
      return false;
    }
    return koreanRegExp.allMatches(nickname).length == nickname.length &&
        nickname.length >= 1;
  }

  void checkNicknameConflicted() {
    isNicknamePass = true;
  }

  void setImage(String imagePath, bool isSvg) {
    _image = imagePath;
    _isSvg = isSvg;
    notifyListeners();
  }

  bool completeSecondPage() {
    if (!checkNickname(nickname)) {
      errorMessage = "닉네임을 확인해 주세요";
      return false;
    }

    if (!isNicknamePass) {
      errorMessage = "닉네임 중복확인을 해주세요";
      return false;
    }

    return true;
  }
}
