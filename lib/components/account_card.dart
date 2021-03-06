import 'package:flutter/material.dart';
import 'package:toss/model/domain/account.dart';
import 'package:toss/utils/router.dart';
import 'package:toss/views/detail_account/detail_account_screen.dart';

class AccountCard extends StatelessWidget {
  Account account;

  AccountCard(this.account, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 5),
        child: Card(
            color: Color(0xffB3DEB7),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: InkWell(
              onTap: () {
                AppRouter.push(
                    context,
                    DetailAccountScreen(
                        account: account,
                        accountIdx: account.accountNumber,
                        accountColor: Color(0xffB3DEB7)));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 17.0, left: 15),
                            child: Text(
                              account.accountName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 15),
                            child: Text(
                              account.accountNumber,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                        ],
                      ),
                      Flexible(child: Container(), flex: 1),
                      InkWell(
                        onTap: () {},
                        child: Icon(Icons.more_vert, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                  SizedBox(height: 40),
                  Center(
                      child: Text('${account.money}???',
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              ?.copyWith(color: Colors.black))),
                  SizedBox(height: 40),
                  Stack(
                    children: [
                      Center(
                          child: Column(
                        children: [
                          SizedBox(height: 10),
                          Container(height: 25, width: 1, color: Colors.grey),
                          SizedBox(height: 10)
                        ],
                      )),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 100,
                                child: Container(
                                  width: double.infinity,
                                  child: InkWell(
                                    onTap: () {
                                      debugPrint("asdf");
                                    },
                                    child: Center(
                                      child: Text(
                                        '??????',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff424242),
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 100,
                                child: Container(
                                  width: double.infinity,
                                  child: InkWell(
                                    onTap: () {
                                      debugPrint("asdf");
                                    },
                                    child: Center(
                                      child: Text(
                                        '????????? ??????',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff424242),
                                          fontSize: 15,
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
                    ],
                  ),
                  SizedBox(height: 5),
                ],
              ),
            )));
  }
}
