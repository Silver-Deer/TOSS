import 'package:flutter/material.dart';
import 'package:toss/components/transfer_history_card.dart';
import 'package:toss/model/domain/account.dart';

class DetailAccountScreen extends StatefulWidget {
  String accountIdx;
  Color accountColor;
  Account account;
  DetailAccountScreen(
      {Key? key,
      required this.account,
      required this.accountIdx,
      required this.accountColor})
      : super(key: key);

  @override
  _DetailAccountScreenState createState() => _DetailAccountScreenState(
      account: account, accountIdx: accountIdx, accountColor: accountColor);
}

class _DetailAccountScreenState extends State<DetailAccountScreen> {
  String accountIdx;
  Color accountColor;
  Account account;
  _DetailAccountScreenState(
      {required this.account,
      required this.accountIdx,
      required this.accountColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: accountColor,
          iconTheme: IconTheme.of(context),
          title: Text(
            account.accountName,
            style:
                Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 15),
          ),
          centerTitle: true,
        ),
        body: ListView(children: [
          buildHead(account, accountColor),
          buildTransferHistory()
        ]));
  }

  Widget buildHead(Account account, Color accountColor) {
    return Container(
      color: accountColor,
      width: double.infinity,
      height: 240,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(account.accountNumber,
              style: Theme.of(context).textTheme.bodyText1),
          SizedBox(height: 15),
          Text("${account.money}원",
              style: Theme.of(context).textTheme.headline1),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                child: Card(
                    elevation: 0,
                    color: Color(0x55FFFFFF),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 40, right: 40, top: 15, bottom: 15),
                      child: Text('이체하기',
                          style: Theme.of(context).textTheme.bodyText2),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3))),
              ),
              InkWell(
                child: Card(
                    elevation: 0,
                    color: Color(0x55FFFFFF),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 40, right: 40, top: 15, bottom: 15),
                      child: Text('가져오기',
                          style: Theme.of(context).textTheme.bodyText2),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3))),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildTransferHistory() {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int idx) =>
            ListTile(onTap: () {}, title: TransferHistoryCard()),
        separatorBuilder: (BuildContext context, int index) =>
            Divider(thickness: 0.5),
        itemCount: 10);
  }
}
