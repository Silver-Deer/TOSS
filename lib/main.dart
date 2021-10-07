import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toss/theme/theme_config.dart';
import 'package:toss/view_models/app_provider.dart';
import 'package:toss/view_models/first_sign_up_provider.dart';
import 'package:toss/view_models/home_provider.dart';
import 'package:toss/view_models/second_sign_up_provider.dart';
import 'package:toss/view_models/third_sign_up_provider.dart';
import 'package:toss/views/sign_up/sign_up_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AppProvider()),
      ChangeNotifierProvider(create: (_) => HomeProvider()),
      ChangeNotifierProvider(create: (_) => FirstSignUpProvider()),
      ChangeNotifierProvider(create: (_) => SecondSignUpProvider()),
      ChangeNotifierProvider(create: (_) => ThirdSignUpProvider()),
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
          home: SignUpScreen(),
        );
      },
    );
  }
}
