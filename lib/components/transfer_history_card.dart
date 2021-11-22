import 'package:flutter/material.dart';

class TransferHistoryCard extends StatelessWidget {
  const TransferHistoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 75,
        width: double.infinity,
        child: Row(children: [
          Text('11.22',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontSize: 12)),
          SizedBox(width: 10),
          Expanded(
              child: Text('가나다',
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(fontSize: 15))),
          SizedBox(width: 10),
          Text('-1000원',
              style:
                  Theme.of(context).textTheme.headline1?.copyWith(fontSize: 15))
        ]));
  }
}
