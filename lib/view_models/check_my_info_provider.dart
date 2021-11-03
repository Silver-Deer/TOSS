import 'package:flutter/widgets.dart';

class CheckMyInfoProvider extends ChangeNotifier {
  List<bool> _checkList = [false, false, false, false];
  List<bool> get checkList => _checkList;

  void toggleCheckList(int position) {
    checkList[position] = !checkList[position];
    notifyListeners();
  }
}
