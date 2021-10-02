import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:toss/utils/router.dart';
import 'package:toss/view_models/sign_up_provider.dart';
import 'package:toss/views/sign_up/second_sign_up_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController confirmPwController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  FocusNode genderFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final SignUpProvider signUpProvider = Provider.of<SignUpProvider>(context);

    idController.value = TextEditingValue(
        text: signUpProvider.id,
        selection: TextSelection.fromPosition(
            TextPosition(offset: signUpProvider.id.length)));

    pwController.value = TextEditingValue(
        text: signUpProvider.pw,
        selection: TextSelection.fromPosition(
            TextPosition(offset: signUpProvider.pw.length)));

    confirmPwController.value = TextEditingValue(
        text: signUpProvider.confirmPw,
        selection: TextSelection.fromPosition(
            TextPosition(offset: signUpProvider.confirmPw.length)));

    phoneNumberController.value = TextEditingValue(
        text: signUpProvider.phoneNumber,
        selection: TextSelection.fromPosition(
            TextPosition(offset: signUpProvider.phoneNumber.length)));

    birthController.value = TextEditingValue(
        text: signUpProvider.birth,
        selection: TextSelection.fromPosition(
            TextPosition(offset: signUpProvider.birth.length)));

    genderController.value = TextEditingValue(
        text: signUpProvider.gender,
        selection: TextSelection.fromPosition(
            TextPosition(offset: signUpProvider.gender.length)));

    nameController.value = TextEditingValue(
        text: signUpProvider.name,
        selection: TextSelection.fromPosition(
            TextPosition(offset: signUpProvider.name.length)));

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
                  SizedBox(height: 35),
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
                  buildInputBox(TextField(
                    textInputAction: TextInputAction.next,
                    controller: idController,
                    onChanged: (text) {
                      signUpProvider.setId(text);
                    },
                  )),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                        onPressed: () {
                          signUpProvider.checkIdConflicted();
                        },
                        child: Text('중복확인')),
                  ),
                  SizedBox(height: 35),
                  buildTitle('패스워드'),
                  SizedBox(height: 10),
                  buildInputBox(TextField(
                    textInputAction: TextInputAction.next,
                    controller: pwController,
                    onChanged: (text) {
                      signUpProvider.setPw(text);
                    },
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                  )),
                  SizedBox(height: 5),
                  buildPasswordTooltip(signUpProvider),
                  SizedBox(height: 35),
                  buildTitle('패스워드 확인'),
                  SizedBox(height: 10),
                  buildInputBox(TextField(
                    textInputAction: TextInputAction.next,
                    controller: confirmPwController,
                    onChanged: (text) {
                      signUpProvider.setconfirmPw(text);
                    },
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                  )),
                  SizedBox(height: 35),
                  buildTitle('전화번호'),
                  SizedBox(height: 10),
                  buildInputBox(TextField(
                    textInputAction: TextInputAction.next,
                    controller: phoneNumberController,
                    onChanged: (text) {
                      signUpProvider.setPhoneNumber(text);
                    },
                    keyboardType: TextInputType.phone,
                  )),
                  SizedBox(height: 35),
                  buildTitle('주민등록번호'),
                  SizedBox(height: 10),
                  Row(children: [
                    Flexible(
                        child: buildInputBox(TextField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        counterText: "",
                      ),
                      style: TextStyle(letterSpacing: 16),
                      controller: birthController,
                      onChanged: (text) {
                        signUpProvider.setBirth(text);
                        if (text.length == 6) {
                          genderFocusNode.requestFocus();
                        }
                      },
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                    ))),
                    SizedBox(width: 8),
                    Flexible(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                          Container(
                            width: 20,
                            child: TextField(
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                counterText: "",
                              ),
                              focusNode: genderFocusNode,
                              controller: genderController,
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              textAlign: TextAlign.center,
                              onChanged: (text) {
                                signUpProvider.setGender(text);
                              },
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: CircleAvatar(
                              backgroundColor: Theme.of(context).shadowColor,
                              radius: 7,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: CircleAvatar(
                              backgroundColor: Theme.of(context).shadowColor,
                              radius: 7,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: CircleAvatar(
                              backgroundColor: Theme.of(context).shadowColor,
                              radius: 7,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: CircleAvatar(
                              backgroundColor: Theme.of(context).shadowColor,
                              radius: 7,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: CircleAvatar(
                              backgroundColor: Theme.of(context).shadowColor,
                              radius: 7,
                            ),
                          ),
                        ]
                            // List.generate(
                            //   6,
                            //   (index) =>
                            // ),
                            ))
                  ]),
                  SizedBox(height: 35),
                  buildTitle('이름'),
                  SizedBox(height: 10),
                  buildInputBox(TextField(
                    textInputAction: TextInputAction.done,
                    controller: nameController,
                    onChanged: (text) {
                      signUpProvider.setName(text);
                    },
                    keyboardType: TextInputType.name,
                  )),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          if (signUpProvider.complete()) {
                            AppRouter.push(context, SecondSignUpScreen());
                          } else {
                            Fluttertoast.showToast(
                                msg: signUpProvider.errorMessage,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 25.0);
                          }
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

  Widget buildInputBox(TextField textField) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
        child: textField);
  }

  Widget buildPasswordTooltip(SignUpProvider provider) {
    const TextStyle style = TextStyle(fontSize: 12);

    const Icon pass = Icon(Icons.check_circle, color: Colors.green);
    const Icon unpass = Icon(Icons.cancel, color: Colors.red);

    Widget buildToolTip(bool isPass, String message) {
      Icon icon;
      if (isPass)
        icon = pass;
      else
        icon = unpass;
      return Row(
        children: [
          icon,
          SizedBox(width: 5),
          Text(message, style: style),
          SizedBox(width: 15)
        ],
      );
    }

    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      buildToolTip(provider.isPwLengthPass, "8~12자"),
      buildToolTip(provider.isPwEnglishPass, "영어"),
      buildToolTip(provider.isPwNumberPass, "숫자"),
      buildToolTip(provider.isPwSpecialPass, "특수문자"),
    ]);
  }
}
