import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: ScrollConfiguration(
            behavior: ScrollBehavior(),
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('회원가입',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      Text('1단계',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 19),
                  Row(
                    children: [
                      Spacer(),
                      Text(
                        '계정이 있으신가요?',
                        style: TextStyle(color: Color(0xFF0064FF)),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  buildTitle('아이디'),
                  SizedBox(height: 10),
                  buildInputBox(),
                  SizedBox(height: 35),
                  buildTitle('패스워드'),
                  SizedBox(height: 10),
                  buildInputBox(),
                  SizedBox(height: 35),
                  buildTitle('패스워드 확인'),
                  SizedBox(height: 10),
                  buildInputBox(),
                  SizedBox(height: 35),
                  buildTitle('전화번호'),
                  SizedBox(height: 10),
                  buildInputBox(),
                  SizedBox(height: 35),
                  buildTitle('주민등록번호'),
                  SizedBox(height: 10),
                  Row(children: [
                    Flexible(child: buildInputBox()),
                    SizedBox(width: 8),
                    Flexible(child: buildInputBox())
                  ]),
                  SizedBox(height: 35),
                  buildTitle('이름'),
                  SizedBox(height: 10),
                  buildInputBox(),
                  SizedBox(height: 35),
                  buildTitle('별명'),
                  SizedBox(height: 10),
                  buildInputBox(isLast: true),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            '다음',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0064FF)),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff7E7E7E)),
    );
  }

  Widget buildInputBox({bool isLast = false}) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(15, 0, 5, 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Color(0xFFE5E5E5)),
        child: TextField(
          textInputAction: isLast ? TextInputAction.done : TextInputAction.next,
          decoration: InputDecoration(border: InputBorder.none),
        ));
  }
}
