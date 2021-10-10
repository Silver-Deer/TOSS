import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:toss/main_screen.dart';
import 'package:toss/utils/router.dart';

class CompleteSignUpScreen extends StatefulWidget {
  const CompleteSignUpScreen({Key? key}) : super(key: key);

  @override
  _CompleteSignUpScreenState createState() => _CompleteSignUpScreenState();
}

class _CompleteSignUpScreenState extends State<CompleteSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      AppRouter.pushReplacementAll(context, MainScreen());
    });

    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitCircle(
                color: Colors.blue,
                size: 70,
              ),
              SizedBox(height: 15),
              Text(
                '토스에 가입하는 중...',
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
