import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:toss/utils/router.dart';
import 'package:toss/view_models/sign_up_provider.dart';
import 'package:toss/views/sign_up/third_sign_up_screen.dart';

class SecondSignUpScreen extends StatefulWidget {
  const SecondSignUpScreen({Key? key}) : super(key: key);

  @override
  _SecondSignUpScreenState createState() => _SecondSignUpScreenState();
}

class _SecondSignUpScreenState extends State<SecondSignUpScreen> {
  static const List<String> iconList = [
    "asset/icon/camera.svg",
    "asset/icon/gallery.svg",
    "asset/icon/alien.svg",
    "asset/icon/cat.svg",
    "asset/icon/dog.svg",
    "asset/icon/flower.svg",
    "asset/icon/hare.svg",
    "asset/icon/heart.svg",
    "asset/icon/leaf.svg",
    "asset/icon/lion.svg",
    "asset/icon/pig.svg",
    "asset/icon/wolf.svg"
  ];

  @override
  Widget build(BuildContext context) {
    SignUpProvider signUpProvider = Provider.of<SignUpProvider>(context);
    Widget profileImage = Container();
    if (signUpProvider.image == "") {
      profileImage = Container(
        width: 200,
        height: 200,
        child: CircleAvatar(backgroundColor: Colors.grey),
      );
    } else if (signUpProvider.isSvg) {
      profileImage = Container(
          width: 200,
          height: 200,
          child: SvgPicture.file(File(signUpProvider.image)));
    } else {
      profileImage = Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: FileImage(File(signUpProvider.image)))));
    }

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
              profileImage,
              SizedBox(height: 20),
              TextField(
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                maxLines: 1,
                controller: TextEditingController.fromValue(TextEditingValue(
                    text: signUpProvider.nickname,
                    selection: TextSelection.fromPosition(
                        TextPosition(offset: signUpProvider.nickname.length)))),
                onChanged: (text) {
                  signUpProvider.setNickname(text);
                },
                showCursor: false,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '별명을 입력해 주세요',
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
              ElevatedButton(
                  onPressed: () {
                    signUpProvider.checkNicknameConflicted();
                  },
                  child: Text('중복확인')),
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
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () async {
                            if (index == 0) {
                              var image = await ImagePicker.platform
                                  .pickImage(source: ImageSource.camera);
                              signUpProvider.setImage(image?.path ?? "", false);
                            } else if (index == 1) {
                              var image = await ImagePicker.platform
                                  .pickImage(source: ImageSource.gallery);
                              signUpProvider.setImage(image?.path ?? "", false);
                            } else {
                              var byteData =
                                  await rootBundle.load(iconList[index]);
                              var file = File(
                                  '${(await getTemporaryDirectory()).path}/image$index');
                              await file.writeAsBytes(byteData.buffer
                                  .asUint8List(byteData.offsetInBytes,
                                      byteData.lengthInBytes));
                              signUpProvider.setImage(file.path, true);
                            }
                          },
                          child: SvgPicture.asset(
                            iconList[index],
                          ),
                        )),
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
                      if (signUpProvider.completeSecondPage()) {
                        FocusScope.of(context).unfocus();
                        AppRouter.push(context, ThirdSignUpScreen());
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
