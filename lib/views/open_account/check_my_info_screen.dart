import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toss/utils/router.dart';
import 'package:toss/view_models/check_my_info_provider.dart';

class CheckMyInfoScreen extends StatefulWidget {
  const CheckMyInfoScreen({Key? key}) : super(key: key);

  @override
  _CheckMyInfoScreenState createState() => _CheckMyInfoScreenState();
}

class _CheckMyInfoScreenState extends State<CheckMyInfoScreen> {
  @override
  Widget build(BuildContext context) {
    CheckMyInfoProvider provider = Provider.of<CheckMyInfoProvider>(context);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).backgroundColor,
          title: Center(
              child: Text('계좌개설',
                  style: TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.black))),
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Center(
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('취소',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black))),
              ),
            )
          ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: buildBody(provider)),
          InkWell(
            onTap:
                provider.checkList.any((item) => item == false) ? () {} : () {},
            child: Container(
                width: double.infinity,
                height: 50,
                color: provider.checkList.any((item) => item == false)
                    ? Color(0xFFCDCDCD)
                    : Color(0xFFFEE300),
                child: Center(child: Text('다음'))),
          )
        ],
      ),
    );
  }

  Widget buildCard() {
    return Container(
        color: Color(0xFFFEE300),
        height: 200,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Toss Bank',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          SizedBox(height: 20),
          Text('실명 정보 확인', style: TextStyle(fontSize: 13, color: Colors.black)),
        ]));
  }

  Widget buildBody(CheckMyInfoProvider provider) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            buildCard(),
            SizedBox(height: 30),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              buildTitle('성명 입력'),
              SizedBox(width: 20),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(color: Color(0xFFDCDCDC)),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    style: TextStyle(fontSize: 13),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
              ),
            ]),
            SizedBox(height: 30),
            buildTitle('주민등록번호 입력'),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xFFDCDCDC)),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: TextField(
                        maxLength: 6,
                        style: TextStyle(fontSize: 13, letterSpacing: 8),
                        decoration: InputDecoration(
                            border: InputBorder.none, counterText: "")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Text(
                    '-',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xFFDCDCDC)),
                    // padding: EdgeInsets.only(left: 10, right: 10),
                    child: TextField(
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, letterSpacing: 0),
                        decoration: InputDecoration(
                            border: InputBorder.none, counterText: "")),
                  ),
                ),
                Expanded(
                  child: Container(),
                  flex: 4,
                ),
              ],
            ),
            SizedBox(height: 50),
            buildTitle('이용약관 동의'),
            SizedBox(height: 50),
            buildAgreement("토스뱅크 입출금통장 상품설명서", provider.checkList[0],
                () => provider.toggleCheckList(0), ""),
            SizedBox(height: 30),
            buildAgreement("상품 이용약관", provider.checkList[1],
                () => provider.toggleCheckList(1), ""),
            SizedBox(height: 30),
            buildAgreement("불법 및 탈법 차명거래 금지 설명 확인", provider.checkList[2],
                () => provider.toggleCheckList(2), ""),
            SizedBox(height: 30),
            buildAgreement("예금자보호법 설명 확인", provider.checkList[3],
                () => provider.toggleCheckList(3), ""),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }

  Widget buildTitle(String title) {
    return Text(title, style: TextStyle(fontSize: 17));
  }

  Widget buildAgreement(
      String title, bool isChecked, Function() onTap, String subscription) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
          side: BorderSide(
        color: isChecked ? Color(0xFFFEE300) : Color(0xFFD8D8D8),
      )),
      color: isChecked ? Color(0xFFFEE300) : Color(0xFFFFFFFF),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
          child: Row(
            children: [
              isChecked
                  ? Icon(
                      Icons.check,
                      size: 30,
                      color: Colors.black,
                    )
                  : Icon(Icons.check_circle_outline,
                      size: 30, color: Color(0xFFD8D8D8)),
              SizedBox(width: 15),
              Expanded(child: Text(title)),
              Icon(Icons.keyboard_arrow_right_outlined)
            ],
          ),
        ),
      ),
    );
  }
}
