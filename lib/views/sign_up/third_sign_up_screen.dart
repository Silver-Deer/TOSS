import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toss/view_models/third_sign_up_provider.dart';

class ThirdSignUpScreen extends StatefulWidget {
  const ThirdSignUpScreen({Key? key}) : super(key: key);

  @override
  _ThirdSignUpScreenState createState() => _ThirdSignUpScreenState();
}

class _ThirdSignUpScreenState extends State<ThirdSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    ThirdSignUpProvider signUpProvider =
        Provider.of<ThirdSignUpProvider>(context);

    Widget buildNumButton(int num) {
      return Flexible(
        flex: 1,
        child: Container(
          width: double.infinity,
          child: TextButton(
            onPressed: () {
              if (signUpProvider.isTargetConfirm) {
                signUpProvider.addOneSimpleConfirmPw(num);
              } else {
                signUpProvider.addOneSimplePw(num);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '$num',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Row(
                children: [
                  Text('간편 비밀번호 설정',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text('3단계',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                ],
              ),
              Flexible(flex: 2, child: Container()),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                        6,
                        (index) => CircleAvatar(
                              radius: 20,
                              backgroundColor: index <
                                      (signUpProvider.isTargetConfirm
                                          ? signUpProvider
                                              .confirmSimplePw.length
                                          : signUpProvider.simplePw.length)
                                  ? Colors.black
                                  : Colors.blue,
                            ))),
              ),
              Flexible(flex: 1, child: Container()),
              Text(
                  '${signUpProvider.isTargetConfirm ? "비밀번호를 한번 더 입력해 주세요" : ""}'),
              Flexible(flex: 1, child: Container()),
              Row(
                  children:
                      List.generate(3, (index) => buildNumButton(index + 1))),
              Row(
                  children:
                      List.generate(3, (index) => buildNumButton(index + 4))),
              Row(
                  children:
                      List.generate(3, (index) => buildNumButton(index + 7))),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                        width: double.infinity,
                        child: TextButton(
                            onPressed: () {
                              signUpProvider.setTarget(false);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Icon(Icons.refresh),
                            ))),
                  ),
                  buildNumButton(0),
                  Flexible(
                    flex: 1,
                    child: Container(
                        width: double.infinity,
                        child: TextButton(
                            onPressed: () {
                              if (signUpProvider.isTargetConfirm) {
                                signUpProvider.addOneSimpleConfirmPw(-1);
                              } else {
                                signUpProvider.addOneSimplePw(-1);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Icon(Icons.arrow_back),
                            ))),
                  )
                ],
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
