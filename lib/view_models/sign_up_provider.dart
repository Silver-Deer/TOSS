import 'package:flutter/cupertino.dart';

class SignUpProvider extends ChangeNotifier {
  String _id = "";
  String get id => _id;
  String _pw = "";
  String get pw => _pw;
  String _confirmPw = "";
  String get confirmPw => _confirmPw;
  String _phoneNumber = "";
  String get phoneNumber => _phoneNumber;
  String _birth = "";
  String get birth => _birth;
  String _gender = "";
  String get gender => _gender;
  String _name = "";
  String get name => _name;
  String _nickname = "";
  String get nickname => _nickname;
  String _simplePw = "";
  String get simplePw => _simplePw;
  String _confirmSimplePw = "";
  String get confirmSimplePw => _confirmSimplePw;

  String _image = "";
  String get image => _image;
  bool _isSvg = false;
  bool get isSvg => _isSvg;

  bool isIdPass = false;
  bool isPwLengthPass = false;
  bool isPwEnglishPass = false;
  bool isPwNumberPass = false;
  bool isPwSpecialPass = false;
  bool isNicknamePass = false;

  String errorMessage = "";

  static final RegExp regExp = RegExp('[^a-z|^A-Z|^0-9]');
  static final RegExp enRegExp = RegExp('[a-z|A-Z]');
  static final RegExp numRegExp = RegExp('[0-9]');
  static final RegExp specialExp = RegExp(r'[\.!@#<>?":_`~;[\]\\|=+)(*&^%-]');
  static final RegExp notNumRegExp = RegExp('[^0-9]');
  static final RegExp koreanRegExp = RegExp(r'[\uac00-\ud7af|a-z|A-Z|\s]');

  void setId(String id) {
    bool isSafe = checkId(id);
    if (isSafe) {
      _id = id;
    }
    notifyListeners();
  }

  void setPw(String pw) {
    if (checkPw(pw)) {
      _pw = pw;
    }
  }

  void setconfirmPw(String confirmPw) {
    if (confirmPw == "")
      _confirmPw = confirmPw;
    else {
      String last = confirmPw[confirmPw.length - 1];
      bool isSafe = enRegExp.hasMatch(last) ||
          numRegExp.hasMatch(last) ||
          specialExp.hasMatch(last);
      if (isSafe) {
        _confirmPw = confirmPw;
      }
    }
    notifyListeners();
  }

  void setPhoneNumber(String phoneNumber) {
    if (!notNumRegExp.hasMatch(phoneNumber)) {
      _phoneNumber = phoneNumber;
    }
    notifyListeners();
  }

  void setBirth(String birth) {
    if (!notNumRegExp.hasMatch(birth)) {
      _birth = birth;
    }
    notifyListeners();
  }

  void setGender(String gender) {
    const List<String> list = ['1', '2', '3', '4'];
    if (gender == "" ||
        !notNumRegExp.hasMatch(gender) && list.contains(gender)) {
      _gender = gender;
    }
    notifyListeners();
  }

  void setName(String name) {
    if (specialExp.hasMatch(name) || numRegExp.hasMatch(name)) {
      notifyListeners();
      return;
    }
    _name = name;
  }

  void setNickname(String nickname) {
    if (specialExp.hasMatch(nickname) || numRegExp.hasMatch(nickname)) {
      notifyListeners();
      return;
    }
    _nickname = nickname;
  }

  bool completeFirstPage() {
    if (!checkId(id) || id.length < 3 || id.length > 12) {
      errorMessage = "아이디를 확인해 주세요";
      return false;
    }

    if (!isIdPass) {
      errorMessage = "아이디 중복을 확인해 주세요";
      return false;
    }

    if (!isPwSpecialPass ||
        !isPwLengthPass ||
        !isPwNumberPass ||
        !isPwEnglishPass) {
      errorMessage = "비밀번호를 확인해 주세요";
      return false;
    }

    if (pw != confirmPw) {
      errorMessage = "비밀번호가 일치하지 않습니다";
      return false;
    }

    if (!checkPhoneNumber(phoneNumber)) {
      errorMessage = "전화번호를 확인해 주세요";
      return false;
    }

    if (!checkName(name)) {
      errorMessage = "이름을 확인해 주세요";
      return false;
    }

    return true;
  }

  bool checkId(String text) {
    if (regExp.hasMatch(text)) {
      return false;
    }

    return true;
  }

  bool checkPw(String pw) {
    isPwLengthPass = pw.length >= 8 && pw.length <= 12;
    isPwEnglishPass = enRegExp.hasMatch(pw);
    isPwNumberPass = numRegExp.hasMatch(pw);
    isPwSpecialPass = specialExp.hasMatch(pw);

    notifyListeners();

    if (pw == "") return true;
    String last = pw[pw.length - 1];
    return enRegExp.hasMatch(last) ||
        numRegExp.hasMatch(last) ||
        specialExp.hasMatch(last);
  }

  bool checkPhoneNumber(String phoneNumber) {
    return phoneNumber.length == 11 &&
        !notNumRegExp.hasMatch(phoneNumber) &&
        phoneNumber.substring(0, 3) == "010";
  }

  bool checkBirthAndGender(String birth, String gender) {
    String century;
    if (gender == '1' || gender == '2') {
      century = '19';
    } else if (gender == '3' || gender == '4') {
      century = '20';
    } else {
      return false;
    }
    try {
      int year = int.parse('$century${birth.substring(0, 2)}');
      int month = int.parse('${birth.substring(2, 4)}');
      int day = int.parse('${birth.substring(4, 6)}');
      DateTime date = DateTime.utc(year, month, day);
      debugPrint("date ${date.toString()}");
      return date.year == year && date.month == month && date.day == day;
    } on FormatException {
      return false;
    }
  }

  bool checkName(String name) {
    if (specialExp.hasMatch(name) || numRegExp.hasMatch(name)) return false;
    return koreanRegExp.allMatches(name).length == name.length &&
        name.length >= 1;
  }

  bool checkNickname(String nickname) {
    if (specialExp.hasMatch(nickname)) {
      return false;
    }
    return koreanRegExp.allMatches(nickname).length == nickname.length &&
        nickname.length >= 1;
  }

  void checkIdConflicted() {
    isIdPass = true;
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
