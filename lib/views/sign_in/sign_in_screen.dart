import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:toss/main_screen.dart';
import 'package:toss/utils/api_request_status.dart';
import 'package:toss/utils/router.dart';
import 'package:toss/view_models/sign_in_provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignInScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      SignInProvider signInProvider =
          Provider.of<SignInProvider>(context, listen: false);

      signInProvider.loginResult.stream.listen((event) {
        if (event.status == APIRequestStatus.loaded) {
          AppRouter.pushReplacement(context, MainScreen());
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SignInProvider signInProvider = Provider.of<SignInProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 80),
              Flexible(
                child: Container(),
                flex: 1,
              ),
              SvgPicture.asset(
                'asset/icon/toss.svg',
                width: 80,
                height: 80,
              ),
              Flexible(
                child: Container(),
                flex: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                    decoration: InputDecoration(
                      alignLabelWithHint: false,
                      labelText: 'ID',
                    ),
                    onChanged: (text) {
                      signInProvider.id = text;
                    },
                    style: Theme.of(context).textTheme.bodyText1),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                    decoration: InputDecoration(
                      alignLabelWithHint: false,
                      labelText: 'PW',
                    ),
                    onChanged: (text) {
                      signInProvider.pw = text;
                    },
                    obscureText: true,
                    style: Theme.of(context).textTheme.bodyText1),
              ),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "비밀번호를 잊으셨나요?",
                  style: TextStyle(
                      fontSize: 13,
                      color: Color(0xff0064ff),
                      fontWeight: FontWeight.w500),
                ),
              ),
              Flexible(
                child: Container(),
                flex: 1,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Color(0xaa0064ff),
                  child: InkWell(
                    onTap: () {
                      signInProvider.login();
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          '로그인',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
