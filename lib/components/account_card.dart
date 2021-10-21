import 'package:flutter/material.dart';
import 'package:toss/model/domain/account.dart';

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
                    child: Text('${account.money}원',
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
                                      '이체',
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
                                      '입출금 내역',
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
            )));
  }
}
