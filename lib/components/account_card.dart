import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 25, right: 25),
        child: Card(
            color: Color(0xffB3DEB7),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 17.0, left: 15),
                  child: Text(
                    '사승은의 통장',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff343434)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 15),
                  child: Text(
                    '7777-01-5830229',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff5A5A5A)),
                  ),
                ),
                SizedBox(height: 35),
                Center(
                    child: Text('12,652원',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 25))),
                SizedBox(height: 35),
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
