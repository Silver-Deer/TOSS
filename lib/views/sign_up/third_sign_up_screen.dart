import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:toss/utils/router.dart';
import 'package:toss/view_models/third_sign_up_provider.dart';
import 'package:toss/views/home/home_screen.dart';
import 'package:toss/views/sign_up/complete_sign_up_screen.dart';

class ThirdSignUpScreen extends StatefulWidget {
  const ThirdSignUpScreen({Key? key}) : super(key: key);

  @override
  _ThirdSignUpScreenState createState() => _ThirdSignUpScreenState();
}

class _ThirdSignUpScreenState extends State<ThirdSignUpScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ThirdSignUpProvider signUpProvider =
          Provider.of<ThirdSignUpProvider>(context, listen: false);

      signUpProvider.error.stream.listen((event) {
        Fluttertoast.showToast(msg: event, toastLength: Toast.LENGTH_SHORT);
      });

      signUpProvider.complete.stream.listen((event) {
        if (event) {
          AppRouter.push(context, CompleteSignUpScreen());
        }
      });
    });
  }

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
                  Text('?????? ???????????? ??????',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text('3??????',
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
                  '${signUpProvider.isTargetConfirm ? "??????????????? ?????? ??? ????????? ?????????" : ""}'),
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
                        child: Text('??????',
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
