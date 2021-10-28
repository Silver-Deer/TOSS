import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CreateAccountIntroScreen extends StatefulWidget {
  const CreateAccountIntroScreen({Key? key}) : super(key: key);

  @override
  _CreateAccountIntroScreenState createState() =>
      _CreateAccountIntroScreenState();
}

class _CreateAccountIntroScreenState extends State<CreateAccountIntroScreen> {
  double visiblity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Color(0xff3DB087)),
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                buildHeader(context),
                buildComponent1(),
                buildComponent2(),
                buildComponent3(),
                buildComponent4()
              ],
            ),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: AnimatedSize(
              curve: Curves.linear,
              child: Container(
                height: 60 * visiblity,
                child: MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () => {},
                  color: Color(0xff3DB087),
                  child: Text('입출금 통장 신청하기',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 17)),
                ),
              ),
              duration: Duration(milliseconds: 200),
            ),
          )
        ],
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return VisibilityDetector(
        key: Key("Create Button"),
        onVisibilityChanged: (VisibilityInfo info) {
          setState(() {
            visiblity = info.visibleFraction == 0 ? 1 : 0;
          });
        },
        child: Container(
          width: double.infinity,
          height: 450,
          color: Color(0xff3DB087),
          padding: EdgeInsets.fromLTRB(40, 50, 40, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '토스뱅크 입출금통장',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              Text(
                '까다로운\n계좌개설도\n정말 손쉽게',
                style:
                    TextStyle(color: Colors.white, fontSize: 30, height: 1.3),
              ),
              SizedBox(height: 15),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                buildIcon(
                    SvgPicture.asset("asset/icon/people.svg",
                        width: 30, height: 30),
                    '친구에게\n간편한 계좌 이체'),
                buildIcon(
                    SvgPicture.asset("asset/icon/security.svg",
                        width: 30, height: 30),
                    '보안은 더 강력하게')
              ]),
              ElevatedButton(
                onPressed: () {},
                child: Container(
                  height: 45,
                  child: Center(
                      child: Text(
                    '신청하기',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  )),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xff328D6C)),
                  elevation: MaterialStateProperty.all(0),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ));
  }

  Widget buildIcon(SvgPicture icon, String title) {
    return Column(children: [
      icon,
      SizedBox(height: 15),
      Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 12),
      )
    ]);
  }

  Widget buildComponent1() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 50, 40, 0),
            child: Text(
              '누구나 쉽고 스마트하게',
              style: TextStyle(fontSize: 22),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 30, 40, 0),
            child: Text(
              '통장의 많은 정보와 기능들을 쉽고 편리하게 이용할 수 있도록 디자인했습니다.\n간편하게 이체, 거래내역 자세히 보기도 바로바로, 중요한 내용은 놓치지 않고 확인할 수 있습니다',
              style: TextStyle(height: 1.8, fontSize: 13),
            ),
          ),
          SizedBox(height: 40),
          Image.asset('asset/icon/component_img.png')
        ],
      ),
    );
  }

  Widget buildComponent2() {
    return Container(
        color: Color(0xFFF7F7F7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 50, 40, 0),
              child: Text(
                '계좌 속 금고, 세이프박스',
                style: TextStyle(fontSize: 22),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 30, 40, 0),
              child: Text(
                '여러 개의 통장을 만들지 않아도 쉽게 통장 잔고를 관리할 수 있습니다.\n여유자금이 있다면 하루만 맡겨도 연 0.80%(세전)를 제공하는 세이프박스에 보관해보세요.',
                style: TextStyle(height: 1.8, fontSize: 13),
              ),
            ),
            SizedBox(height: 40),
            Image.asset('asset/icon/safebox.png')
          ],
        ));
  }

  Widget buildComponent3() {
    return Container(
      color: Color(0xFFfffff),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 50, 40, 0),
            child: Text(
              '이체는 더욱 간편하게',
              style: TextStyle(fontSize: 22),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 30, 40, 0),
            child: Text(
              '많은 내용을 입력할 필요 없이 입금 계좌번호만 입력하면 간편하게 이체할 수 있습니다.\n예약이체, 여러 건의 이체도 간편하게 이용해보세요',
              style: TextStyle(height: 1.8, fontSize: 13),
            ),
          ),
          SizedBox(height: 40),
          Image.asset('asset/icon/component_img3.png')
        ],
      ),
    );
  }

  Widget buildComponent4() {
    return Container(
      color: Color(0xFF3E445A),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 80),
          Image.asset(
            'asset/icon/component_img4.png',
            width: 100,
          ),
          SizedBox(height: 30),
          Text('언제든지 이용할 수 있는 은행',
              style: TextStyle(fontSize: 20, color: Colors.white)),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 40),
            child: Text(
              '영업점에 방문할 필요 없이 계좌개설, 대출신청, 해외송금, 증명서 발급까지 언제든 필요한 은행 업무를 토스뱅크 모바일앱으로 이용해보세요.',
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white60, fontSize: 13, height: 1.8),
            ),
          )
        ],
      ),
    );
  }
}
