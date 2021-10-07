import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:toss/components/account_card.dart';
import 'package:toss/components/body_builder.dart';
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
    SchedulerBinding.instance?.addPostFrameCallback(
        (_) => Provider.of<HomeProvider>(context, listen: false).getContents());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder:
        (BuildContext buildContext, HomeProvider homeProvider, Widget? child) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          title: Container(
            margin: EdgeInsets.only(top: 20, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "사승은",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
                ),
                Icon(
                  Icons.account_circle,
                  size: 50,
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
        apiRequestStatus: homeProvider.apiRequestStatus,
        child: _buildBodyList(homeProvider),
        reload: () => homeProvider.getContents());
  }

  Widget _buildBodyList(HomeProvider homeProvider) {
    return RefreshIndicator(
      child: ListView(
        children: [
          _buildAccountList(),
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

  Widget _buildAccountList() {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        AccountCard(),
        AccountCard(),
        AccountCard(),
      ],
    );
  }
}
