import 'package:flutter/material.dart';
import 'package:toss/utils/enter_exit_route.dart';
import 'package:toss/views/sign_up/third_sign_up_screen.dart';

class SecondSignUpScreen extends StatefulWidget {
  const SecondSignUpScreen({Key? key}) : super(key: key);

  @override
  _SecondSignUpScreenState createState() => _SecondSignUpScreenState();
}

class _SecondSignUpScreenState extends State<SecondSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(toolbarHeight: 0),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Row(
                children: [
                  Text('프로필 설정',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text('2단계',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 56),
              CircleAvatar(
                radius: 90,
              ),
              SizedBox(height: 20),
              TextField(
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                maxLines: 1,
                showCursor: false,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '별명을 입력해 주세요',
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
              SizedBox(height: 45),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 35.0,
                      mainAxisSpacing: 40.0,
                    ),
                    shrinkWrap: true,
                    itemCount: 12,
                    itemBuilder: (context, index) => CircleAvatar()),
              ),
              Flexible(flex: 1, child: Container()),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Text('이전',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black))),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          EnterExitRoute(
                              exitPage: this.widget,
                              enterPage: ThirdSignUpScreen()));
                    },
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
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
