import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toss/main_screen.dart';
import 'package:toss/theme/theme_config.dart';
import 'package:toss/view_models/app_provider.dart';
import 'package:toss/view_models/home_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AppProvider()),
      ChangeNotifierProvider(create: (_) => HomeProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (BuildContext context, AppProvider appProvider, Widget? child) {
        return MaterialApp(
          key: appProvider.key,
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          navigatorKey: appProvider.navigatorKey,
          theme: appProvider.theme,
          darkTheme: ThemeConfig.darkTheme,
          home: MainScreen(),
        );
      },
    );
  }
}
