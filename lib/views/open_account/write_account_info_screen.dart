import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toss/utils/router.dart';
import 'package:toss/views/open_account/complete_open_account_screen.dart';

class WriteAccountInfoScreen extends StatefulWidget {
  const WriteAccountInfoScreen({Key? key}) : super(key: key);

  @override
  _WriteAccountInfoScreenState createState() => _WriteAccountInfoScreenState();
}

class _WriteAccountInfoScreenState extends State<WriteAccountInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('계좌 정보', style: Theme.of(context).textTheme.bodyText1),
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: Container(color: Colors.white, child: buildBody()),
    );
  }

  Widget buildBody() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                '계좌 별명',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(color: Color(0xFFEEEEEE)),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    style: TextStyle(fontSize: 13),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Row(
            children: [
              Text('계좌 비밀번호', style: TextStyle(fontSize: 15)),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(color: Color(0xFFEEEEEE)),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    style: TextStyle(fontSize: 13),
                    obscureText: true,
                    maxLength: 6,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      counterText: "",
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Row(
            children: [
              Text('비밀번호 확인', style: TextStyle(fontSize: 15)),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(color: Color(0xFFEEEEEE)),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    style: TextStyle(fontSize: 13),
                    obscureText: true,
                    maxLength: 6,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      counterText: "",
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(child: Container(), flex: 1),
          Container(
            width: double.infinity,
            height: 50,
            child: TextButton(
              onPressed: () =>
                  AppRouter.push(context, CompleteOpenAccountScreen()),
              child: Text('확인'),
            ),
          )
        ],
      ),
    );
  }
}
