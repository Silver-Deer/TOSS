import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toss/utils/router.dart';
import 'package:toss/views/home/home_screen.dart';

class CompleteOpenAccountScreen extends StatefulWidget {
  const CompleteOpenAccountScreen({Key? key}) : super(key: key);

  @override
  _CompleteOpenAccountScreenState createState() =>
      _CompleteOpenAccountScreenState();
}

class _CompleteOpenAccountScreenState extends State<CompleteOpenAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('계좌 생성 완료', style: Theme.of(context).textTheme.bodyText1),
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: Container(
          width: double.infinity, color: Colors.white, child: buildBody()),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.yellow,
                  size: 70,
                ),
                SizedBox(height: 20),
                Text(
                  '계좌 계설 완료',
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(height: 15),
                Text(
                  '입출금 통장이 개설되었습니다.\n아래의 내용을 확인해주세요.',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  height: 1.5,
                  color: Color(0xFFE6E6E6),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text('계좌 이름', style: Theme.of(context).textTheme.bodyText1),
                    Expanded(child: Container()),
                    Text('사승은의 계좌',
                        style: Theme.of(context).textTheme.bodyText1)
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  height: 1.5,
                  color: Color(0xFFF0F0F0),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text('계좌종류', style: Theme.of(context).textTheme.bodyText1),
                    Expanded(child: Container()),
                    Text('입출금', style: Theme.of(context).textTheme.bodyText1)
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  height: 1.5,
                  color: Color(0xFFE6E6E6),
                ),
              ],
            ),
          ),
        ),
        TextButton(
            onPressed: () =>
                {AppRouter.pushReplacementAll(context, HomeScreen())},
            child: Container(
                width: double.infinity,
                child: Text(
                  '확인',
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                )))
      ],
    );
  }
}
