import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:toss/components/account_card.dart';
import 'package:toss/components/body_builder.dart';
import 'package:toss/model/domain/account.dart';
import 'package:toss/view_models/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    debugPrint("init");
    SchedulerBinding.instance?.addPostFrameCallback(
        (_) => Provider.of<HomeProvider>(context, listen: false).getContents());
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build");
    return Consumer<HomeProvider>(builder:
        (BuildContext buildContext, HomeProvider homeProvider, Widget? child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          automaticallyImplyLeading: false,
          toolbarHeight: 90,
          title: Container(
            margin: EdgeInsets.only(top: 20, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "사승은",
                  style: Theme.of(context).textTheme.headline1,
                ),
                Icon(
                  Icons.account_circle,
                  size: 50,
                  color: Theme.of(context).canvasColor,
                )
              ],
            ),
          ),
        ),
        body: _buildBody(homeProvider),
      );
    });
  }

  Widget _buildBody(HomeProvider homeProvider) {
    return BodyBuilder(
        apiRequestStatus: homeProvider.networkStatus,
        child: _buildBodyList(homeProvider),
        reload: () => homeProvider.getContents());
  }

  Widget _buildBodyList(HomeProvider homeProvider) {
    return RefreshIndicator(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          _buildAccountList(homeProvider.accountList),
          _buildAddAccountButton(),
        ],
      ),
      onRefresh: () => homeProvider.getContents(),
    );
  }

  Widget _buildTitle(String title) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 10),
      child: Text(title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
    );
  }

  Widget _buildAccountList(List<Account> accountList) {
    return ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: accountList.map((account) => AccountCard(account)).toList());
  }

  Widget _buildAddAccountButton() {
    Color btnBackground =
        SchedulerBinding.instance!.window.platformBrightness == Brightness.light
            ? Color(0xfff4f4f4)
            : Color(0xff252545);

    Color iconColor =
        SchedulerBinding.instance!.window.platformBrightness == Brightness.light
            ? Color(0xffcdcdcd)
            : Color(0xffa0a0a0);

    return Container(
      height: 60,
      margin: EdgeInsets.only(top: 5, bottom: 20),
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(btnBackground),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
              elevation: MaterialStateProperty.all(0.0)),
          onPressed: () {},
          child: Icon(
            Icons.add,
            color: iconColor,
            size: 30,
          )),
    );
  }
}
